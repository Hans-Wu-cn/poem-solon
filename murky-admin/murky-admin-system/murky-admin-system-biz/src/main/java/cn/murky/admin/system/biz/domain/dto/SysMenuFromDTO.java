package cn.murky.admin.system.biz.domain.dto;


import cn.murky.admin.system.api.enums.MenuType;
import cn.murky.admin.system.biz.domain.convert.SysMenuConvert;
import cn.murky.admin.system.biz.domain.entity.SysMenu;
import cn.murky.admin.system.biz.enums.MenuCacheType;
import cn.murky.admin.system.biz.enums.MenuDisplayType;
import cn.murky.admin.system.biz.enums.MenuOpenType;
import cn.murky.admin.system.biz.enums.MenuOutside;
import cn.murky.core.validat.Update;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;
import org.noear.solon.validation.annotation.NotBlank;
import org.noear.solon.validation.annotation.NotNull;


/**
 * 菜单表单类
 *
 * @author hans
 */
@Data
@Accessors(chain = true)
@ApiModel("菜单表单类")
public class SysMenuFromDTO {
    @ApiModelProperty("菜单id")
    @NotNull(groups = Update.class)
    private Long menuId;

    @ApiModelProperty(value = "菜单标题", required = true)
    @NotBlank
    private String label;

    @ApiModelProperty("菜单名称")
    private String name;

    @ApiModelProperty("路由地址")
    private String path;

    @ApiModelProperty(value = "打开方式 1:当前窗口  2:新窗口")
    private MenuOpenType openType;

    @ApiModelProperty("权限码")
    private String auth;

    @ApiModelProperty("上级菜单id")
    private Long parentMenuId;

    @ApiModelProperty(value = "菜单类型 0:目录 1:侧边菜单 2:按钮", required = true)
    @NotNull
    private MenuType type;

    @ApiModelProperty("是否开启缓存 0:关闭  1:开启 ")
    private MenuCacheType isCache;

    @ApiModelProperty("是否显示在菜单  0:显示  1:隐藏")
    private MenuDisplayType isDisplay;

    @ApiModelProperty("是否使用外链  0:否  1:是")
    private MenuOutside isOutside;

    @ApiModelProperty("排序")
    private Short sort;

    @ApiModelProperty("组件路径")
    private String component;

    @ApiModelProperty("图标")
    private String icon;

    @ApiModelProperty("路由参数")
    private String query;

    public SysMenu toEntity() {
        return SysMenuConvert.INSTANCES.toEntity(this);
    }
}
