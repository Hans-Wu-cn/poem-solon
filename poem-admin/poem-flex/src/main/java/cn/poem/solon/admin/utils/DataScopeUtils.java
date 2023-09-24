package cn.poem.solon.admin.utils;

import cn.poem.solon.admin.PoemServiceImpl;
import cn.poem.solon.admin.constant.BusTopicConstant;
import cn.poem.solon.admin.domin.table.PoemDeptAncestorsTableDef;
import cn.poem.solon.admin.domin.table.PoemRoleDeptTableDef;
import cn.poem.solon.admin.domin.table.PoemUserTableDef;
import cn.poem.solon.admin.entity.SecurityUserInfo;
import cn.poem.solon.admin.enums.DataScope;
import com.mybatisflex.core.query.QueryWrapper;
import com.mybatisflex.core.service.IService;
import lombok.extern.slf4j.Slf4j;
import org.noear.dami.Dami;
import org.noear.solon.Solon;

import java.text.MessageFormat;
import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

/**
 * 数据权限工具类
 * 提供数据权限静态调用方法
 *
 * @author hans
 */
@Slf4j
public class DataScopeUtils {
    private static PoemServiceImpl poemService;
    private static final  String CREATE_USER_COLUM="create_user";
    private static PoemRoleDeptTableDef POEM_ROLE_DEPT = PoemRoleDeptTableDef.POEM_ROLE_DEPT;
    private static PoemDeptAncestorsTableDef POEM_DEPT_ANCESTORS = PoemDeptAncestorsTableDef.POEM_DEPT_ANCESTORS;


    /**
     * 数据权限方法，将query绑定数据权限sql
     * @param query query
     * @param userInfo 用户信息
     * @return QueryWrapper
     */
    public static QueryWrapper dataScope(QueryWrapper query, SecurityUserInfo userInfo){
        Set<DataScope> dataScopes = Optional.ofNullable(userInfo.getDataScope()).orElseGet(HashSet::new);
        for (DataScope dataScope : dataScopes) {
            StringBuffer sql=new StringBuffer();
            if (DataScope.CUSTOMIZE.equals(dataScope)) {
                sql.append(MessageFormat.format(" dept_id in (select dept_id from poem_role_dept where role_id in ({0}))",userInfo.getRoleIds()));
//                query.and(MessageFormat.format("dept_id in (select dept_id from poem_role_dept where role_id in ({0}))",userInfo.getRoleIds()));
            }
            if (DataScope.DEPARTMENT_BELOW.equals(dataScope)) {
                sql.append(MessageFormat.format(" (dept_id in (select dept_id from poem_dept_ancestors where ancestors = {0}) or dept_id={0})",userInfo.getDeptId().toString()));

//                query.and(MessageFormat.format("(dept_id in (select dept_id from poem_dept_ancestors where ancestors = {0}) or dept_id={0})",userInfo.getDeptId().toString()));

            }
            if (DataScope.DEPARTMENT.equals(dataScope)) {
                sql.append(MessageFormat.format(" dept_id={0}",userInfo.getDeptId().toString()));

//                query.and(MessageFormat.format("dept_id={0}",userInfo.getDeptId().toString()));
            }
            if (DataScope.ONESELF.equals(dataScope)) {
                sql.append(MessageFormat.format(" create_user = {0}",userInfo.getUserId().toString()));

//                query.and(MessageFormat.format("create_user = {0}",userInfo.getUserId().toString()));
            }
            if(sql.isEmpty()){
                continue;
            }
            query.and(MessageFormat.format("({0})",sql));
        }
        log.debug("sql=================="+query.toSQL());
        return query;
    }

    public static QueryWrapper dataScope(QueryWrapper query){
        return dataScope(query,getUserInfo());
    }

    private static SecurityUserInfo getUserInfo(){
        return Dami.<String, SecurityUserInfo>bus().sendAndResponse(BusTopicConstant.USER_INFO_TOPIC,null);
    }

    private DataScopeUtils(){}

}
