package cn.poem.solon.system.domain.dto;

import cn.poem.solon.core.validat.Update;
import cn.poem.solon.system.domain.convert.PoemRoleConvert;
import cn.poem.solon.system.domain.entity.PoemRole;
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
public class PoemRoleFromDTO {
    @ApiModelProperty("角色id")
    @NotNull(groups = Update.class)
    private Long roleId;

    @ApiModelProperty("角色名")
    @NotBlank
    private String roleName;

    @ApiModelProperty("角色码")
    @NotBlank
    private String roleCode;

    @ApiModelProperty("描述")
    private String describe;

    @ApiModelProperty("描述")
    private List<Long> menuIds;

    public PoemRole toEntity(){
        return PoemRoleConvert.INSTANCES.toEntity(this);
    }
}