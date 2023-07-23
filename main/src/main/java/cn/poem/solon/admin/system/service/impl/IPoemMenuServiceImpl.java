package cn.poem.solon.admin.system.service.impl;

import cn.poem.core.exception.ServiceException;
import cn.poem.solon.admin.system.domain.convert.PoemMenuConvert;
import cn.poem.solon.admin.system.domain.vo.PoemMenuTreeVO;
import cn.poem.solon.admin.system.domain.entity.PoemMenu;
import cn.poem.solon.admin.system.service.IPoemMenuService;
import cn.poem.solon.admin.system.mapper.PoemMenuMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.solon.toolkit.SqlHelper;
import org.noear.solon.annotation.Inject;
import org.noear.solon.annotation.ProxyComponent;
import com.baomidou.mybatisplus.solon.service.impl.ServiceImpl;
import org.noear.solon.data.annotation.Tran;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 菜单service实现
 *
 * @author hans
 */
@ProxyComponent
public class IPoemMenuServiceImpl extends ServiceImpl<PoemMenuMapper, PoemMenu> implements IPoemMenuService {
    @Inject
    PoemMenuConvert converter;

    @Override
    public List<PoemMenuTreeVO> treePoemMenu() {
        List<PoemMenu> allPoemMenuList = baseMapper.selectList(new LambdaQueryWrapper<PoemMenu>()
                .orderByAsc(PoemMenu::getOrder));
        List<PoemMenuTreeVO> poemMenuTreeVOS = converter.poemMenuToPoemMenuTreeVO(allPoemMenuList);
        List<PoemMenuTreeVO> list = poemMenuTreeVOS.stream().filter(item -> item.getParentMenuId() == 0).toList();
        buildTreePoemMenu(list,poemMenuTreeVOS);
        return list;
    }

    /**
     * 重写菜单删除方法
     * @param id
     * @return
     */
    @Override
    @Tran
    public boolean removeById(Serializable id) {
        Long count = baseMapper.selectCount(new LambdaQueryWrapper<PoemMenu>()
                .eq(PoemMenu::getParentMenuId, id)
        );
        if(count !=0){
            throw new ServiceException("删除失败,请保证该菜单没有子级菜单");
        }
        return super.removeById(id);
    }

    /**
     * 构建菜单树
     * @param parentMenuList 父级菜单
     * @param poemMenuList 资源菜单
     */
    private void buildTreePoemMenu(List<PoemMenuTreeVO> parentMenuList,List<PoemMenuTreeVO> poemMenuList){
        for (PoemMenuTreeVO poemMenuTreeVO : parentMenuList) {
            List<PoemMenuTreeVO> treePoemMenu=new ArrayList<>();
            for (PoemMenuTreeVO poemMenu : poemMenuList) {
                if(poemMenu.getParentMenuId().equals(poemMenuTreeVO.getMenuId())){
                    treePoemMenu.add(poemMenu);
                }
            }
            buildTreePoemMenu(treePoemMenu, poemMenuList);
            poemMenuTreeVO.setChildren(treePoemMenu);
        }
    }

//    @Override
//    public BaseMapper<PoemMenu> getPoemMapper() {
//        return baseMapper;
//    }
}
