package cn.poem.solon.admin.saas.domain.convert;

import cn.poem.solon.admin.saas.domain.dto.PoemTenantFromDTO;
import cn.poem.solon.admin.saas.domain.entity.PoemTenant;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * PoemTenant实体转化接口
 *
 * @author hans
 */
@Mapper
public interface PoemTenantConvert {
    PoemTenantConvert INSTANCES = Mappers.getMapper(PoemTenantConvert.class);

    PoemTenant toEntity(PoemTenantFromDTO poemTenantFromDTO);
}
