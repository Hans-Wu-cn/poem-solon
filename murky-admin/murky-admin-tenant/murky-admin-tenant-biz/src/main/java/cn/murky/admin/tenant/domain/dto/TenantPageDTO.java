package cn.murky.admin.tenant.domain.dto;

import cn.murky.admin.tenant.domain.entity.Tenant;
import com.mybatisflex.core.paginate.Page;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
@ApiModel("租户分页DTO实体类")
public class TenantPageDTO extends Page<Tenant> {

    @ApiModelProperty("租户名称")
    private String tenantName;
}
