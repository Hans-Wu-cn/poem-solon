package cn.poem.solon.admin.system.mapper;

import cn.poem.solon.admin.system.domain.entity.PoemRoleMenu;
import cn.poem.solon.admin.system.domain.entity.table.PoemRoleMenuTableDef;
import com.mybatisflex.core.BaseMapper;
import com.mybatisflex.core.query.QueryWrapper;

import java.util.List;

public interface PoemRoleMenuMapper extends BaseMapper<PoemRoleMenu> {
    PoemRoleMenuTableDef POEM_ROLE_MENU = PoemRoleMenuTableDef.POEM_ROLE_MENU;


    /**
     * 根据角色ID删除
     *
     * @param roleId 角色id
     * @return 受影响行数
     */
    default int deleteByRoleId(Long roleId) {
        return this.deleteByQuery(QueryWrapper.create().where(
                        POEM_ROLE_MENU.ROLE_ID.eq(roleId)
                )
        );
    }

    /**
     * 根据角色id查询
     *
     * @param roleId 角色id
     * @return 角色菜单关系对象
     */
    default List<PoemRoleMenu> selectByRoleId(Long roleId) {
        return this.selectListByQuery(QueryWrapper.create().where(
                        POEM_ROLE_MENU.ROLE_ID.eq(roleId)
                )
        );
    }

}