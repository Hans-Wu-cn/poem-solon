package cn.murky.admin.tenant.service;

import cn.murky.admin.tenant.domain.dto.TenantFromDTO;
import cn.murky.admin.tenant.domain.dto.TenantPageDTO;
import cn.murky.admin.tenant.domain.entity.Tenant;
import cn.murky.admin.tenant.domain.vo.TenantVo;
import com.mybatisflex.core.paginate.Page;
import com.mybatisflex.core.service.IService;

/**
 * ITenantService
 *
 * @Author hans
 */
public interface ITenantService extends IService<Tenant> {

    /**
     * 分页接口
     *
     * @param tenantPageDTO 分页DTO对象
     */
    Page<TenantVo> page(TenantPageDTO tenantPageDTO);

    /**
     * 详情接口
     *
     * @param tenantId 租户id
     */
    TenantVo info(Long tenantId);

    /**
     * 添加租户
     *
     * @param tenantFromDTO 租户表单对象
     */
    Boolean add(TenantFromDTO tenantFromDTO);

    /**
     * 修改租户
     *
     * @param tenantFromDTO 租户表单对象
     */
    Boolean edit(TenantFromDTO tenantFromDTO);
}
