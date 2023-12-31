package cn.murky.admin.security.utils;


import cn.dev33.satoken.exception.NotLoginException;
import cn.murky.admin.common.entity.SecurityUserInfo;
import cn.murky.admin.security.SecurityCache;
import org.noear.solon.Solon;


public class SecurityUtils {
    static SecurityCache securityCache;

    static {
        Solon.context().getBeanAsync(SecurityCache.class,SystemSecurityCache ->{
            securityCache=SystemSecurityCache;
        });
    }

    /**
     * 获取当前登录用户ID
     * @return 用户id
     */
    public static Long getUserId(){
        return securityCache.getUserId();
    }

    /**
     * 获取当前登录用户信息
     * @return  当前登录用户信息
     */
    public static SecurityUserInfo getUserInfo() throws NotLoginException {
        return securityCache.getUserInfo();
    }

    /**
     * 保存当前登录用户信息
     * @param securityUser 登录用户信息
     */
    public static void setUserInfo(SecurityUserInfo securityUser){
        securityCache.setUserInfo(securityUser);
    }

    /**
     * 修改当前登录用户信息
     */
    public static void delUserInfo(){
        securityCache.delUserInfo();
    }

    public static Boolean isAdmin() throws NotLoginException {
        return securityCache.admin();
    }


}
