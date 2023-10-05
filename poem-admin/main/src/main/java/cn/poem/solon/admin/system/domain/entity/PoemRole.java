package cn.poem.solon.admin.system.domain.entity;

import cn.poem.solon.admin.domin.BaseEntity;
import cn.poem.solon.admin.enums.DataScope;
import com.mybatisflex.annotation.Id;
import com.mybatisflex.annotation.Table;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 角色实体类
 *
 * @author hans
 */
@Data
@Accessors(chain = true)
@ApiModel("角色实体类")
@Table("poem_role")
public class PoemRole extends BaseEntity {
    @Id
    @ApiModelProperty("主键")
    private Long roleId;

    @ApiModelProperty("角色名")
    private String roleName;

    @ApiModelProperty("角色码")
    private String roleCode;

    @ApiModelProperty("数据权限")
    private DataScope dataScope;

    @ApiModelProperty("部门Id")
    private Long deptId;

    @ApiModelProperty("描述")
    private String describe;
}