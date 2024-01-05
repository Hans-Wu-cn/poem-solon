package cn.murky.admin.tenant.domain.entity;

import com.mybatisflex.annotation.Table;
import com.mybatisflex.core.activerecord.Model;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

/***
 * 租户权限码菜单关系实体
 *
 * @author hans
 */
@Data(staticConstructor = "create")
@Accessors(chain = true)
@ApiModel("租户权限码菜单关系实体类")
@Table("tenant_group_menu")
public class TenantGroupMenu extends Model<TenantGroupMenu> {
    @ApiModelProperty("权限组id")
    private Long groupId;

    @ApiModelProperty("菜单id")
    private Long tenantMenuId;

}
