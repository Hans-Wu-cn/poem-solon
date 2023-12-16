package cn.poem.solon.admin.system.domain.dto;

import cn.poem.solon.admin.common.enums.DataScope;
import cn.poem.solon.admin.system.domain.convert.SysRoleConvert;
import cn.poem.solon.core.validat.Update;
import cn.poem.solon.admin.system.domain.entity.SysRole;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;
import org.noear.solon.validation.annotation.NotBlank;
import org.noear.solon.validation.annotation.NotNull;

import java.util.List;

/**
 * 角色表单类
 *
 * @author hans
 */
@Data
@Accessors(chain = true)
@ApiModel("角色表单类")
public class SysRoleFromDTO {
    @ApiModelProperty("角色id")
    @NotNull(groups = Update.class)
    private Long roleId;

    @ApiModelProperty(value = "角色名", required = true)
    @NotBlank
    private String roleName;

    @ApiModelProperty(value = "角色码", required = true)
    @NotBlank
    private String roleCode;

    @ApiModelProperty("描述")
    private String describe;

    @ApiModelProperty(value = "数据权限",required = true)
    @NotNull
    private DataScope dataScope;

    @ApiModelProperty("所属菜单id")
    private List<Long> menuIds;

    @ApiModelProperty("自定义权限部门Id")
    private List<Long> deptIds;

    public SysRole toEntity() {
        return SysRoleConvert.INSTANCES.toEntity(this);
    }
}
