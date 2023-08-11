package cn.poem.solon.system.mapper;

import cn.poem.solon.system.domain.entity.PoemRole;
import cn.poem.solon.system.domain.entity.table.PoemRoleTableDef;
import com.mybatisflex.core.BaseMapper;
import com.mybatisflex.core.query.QueryWrapper;

import java.util.List;

public interface PoemRoleMapper extends BaseMapper<PoemRole> {

    /**
     * 根据角色码查询数量
     *
     * @return 返回数量
     */
    default Long selectCountByRoleCode(String name,String code) {
        return this.selectCountByQuery(QueryWrapper.create()
                .from(PoemRoleTableDef.POEM_ROLE)
                .where(
                        PoemRoleTableDef.POEM_ROLE.ROLE_CODE.eq(code)
                ).or(PoemRoleTableDef.POEM_ROLE.ROLE_NAME.eq(name))
        );
    }

    /**
     * 根据角色名称或角色码查询角色信息
     * @param name 角色名称
     * @param code 角色码
     * @return 符合条件的角色集合
     */
    default List<PoemRole> selectByNameOrCode(String name, String code) {
        return this.selectListByQuery(QueryWrapper.create().where(
                PoemRoleTableDef.POEM_ROLE.ROLE_NAME.eq(name)
        ).or(PoemRoleTableDef.POEM_ROLE.ROLE_CODE.eq(code)));
    }
}