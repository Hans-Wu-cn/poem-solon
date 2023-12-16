package cn.poem.solon.admin.system.service.impl;

import cn.poem.solon.admin.security.utils.SecurityUtils;
import cn.poem.solon.admin.system.api.domian.SysMenuTree;
import cn.poem.solon.admin.system.api.enums.MenuType;
import cn.poem.solon.admin.system.domain.convert.SysMenuConvert;
import cn.poem.solon.admin.system.domain.dto.SysMenuDropDTO;
import cn.poem.solon.admin.system.domain.entity.SysMenu;
import cn.poem.solon.admin.system.domain.entity.table.SysMenuTableDef;
import cn.poem.solon.admin.system.domain.entity.table.SysRoleMenuTableDef;
import cn.poem.solon.admin.system.mapper.SysMenuMapper;
import cn.poem.solon.admin.system.mapper.SysRoleMenuMapper;
import cn.poem.solon.admin.system.service.ISysMenuService;
import cn.poem.solon.exception.ServiceException;
import com.mybatisflex.core.query.QueryWrapper;
import com.mybatisflex.solon.service.impl.ServiceImpl;
import org.noear.solon.annotation.Component;
import org.noear.solon.annotation.Inject;
import org.noear.solon.data.annotation.Tran;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 菜单service实现
 *
 * @author hans
 */
@Component
public class ISysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenu> implements ISysMenuService {

    @Inject
    private SysRoleMenuMapper sysRoleMenuMapper;
    @Inject
    private ISysMenuServiceImpl iSysMenuService;

    /**
     * 菜单排序接口,设置菜单排序并统一设定父级菜单
     *
     * @param sysMenuDropDTO 菜单拖动接口参数实体对象
     * @return 是否修改成功
     */
    @Tran
    @Override
    public Boolean drop(SysMenuDropDTO sysMenuDropDTO) {
        List<SysMenu> SysMenuList = new ArrayList<>();
        List<Long> menuIds = sysMenuDropDTO.getMenuIds();
        for (int i = 0; i < menuIds.size(); i++) {
            SysMenuList.add(new SysMenu().setMenuId(menuIds.get(i))
                    .setSort(Short.parseShort(String.valueOf(i)))
                    .setParentMenuId(sysMenuDropDTO.getParentMenuId()));
        }
        return iSysMenuService.updateBatch(SysMenuList);
    }

    /**
     * 获取树形菜单
     *
     * @return 菜单树视图对象
     */
    @Override
    public List<SysMenuTree> treeSysMenu(List<MenuType> menuTypes) {
        List<SysMenu> allSysMenuList = mapper.selectByMenuType(menuTypes, SecurityUtils.isAdmin() ? null : SecurityUtils.getUserInfo().getRoleIds());
        List<SysMenuTree> SysMenuTreeVOS = SysMenuConvert.INSTANCES.toEntity(allSysMenuList);
        List<SysMenuTree> list = SysMenuTreeVOS.stream().filter(item -> item.getParentMenuId() == 0).toList();
        buildTreeSysMenu(list, SysMenuTreeVOS);
        return list;
    }

    /**
     * 删除菜单业务
     *
     * @param id 数据主键
     * @return 删除成功状态
     */
    @Override
    @Tran
    public boolean removeById(Serializable id) {
        long count = mapper.selectCountByQuery(
                QueryWrapper.create().from(SysMenuTableDef.SYS_MENU).where(SysMenuTableDef.SYS_MENU.PARENT_MENU_ID.eq(id))
        );
        if (count > 0) {
            throw new ServiceException("删除失败,请保证该菜单没有子级菜单");
        }
        long l = sysRoleMenuMapper.selectCountByQuery(QueryWrapper.create().where(
                SysRoleMenuTableDef.SYS_ROLE_MENU.MENU_ID.eq(id)
        ));
        if (l > 0) {
            throw new ServiceException("删除失败,请保证该菜单没有被角色引用");
        }
        return super.removeById(id);
    }

    /**
     * 构建菜单树
     *
     * @param parentMenuList 父级菜单
     * @param SysMenuList   菜单资源池
     */
    private void buildTreeSysMenu(List<SysMenuTree> parentMenuList, List<SysMenuTree> SysMenuList) {
        for (SysMenuTree SysMenuTreeVO : parentMenuList) {
            List<SysMenuTree> treeSysMenu = new ArrayList<>();
            for (SysMenuTree SysMenu : SysMenuList) {
                if (SysMenu.getParentMenuId().equals(SysMenuTreeVO.getMenuId())) {
                    treeSysMenu.add(SysMenu);
                }
            }
            buildTreeSysMenu(treeSysMenu, SysMenuList);
            SysMenuTreeVO.setChildren(treeSysMenu);
        }
    }
}
