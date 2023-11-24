package cn.poem.solon.admin.config;

import cn.poem.solon.admin.PoemFlexImpl;
import cn.poem.solon.admin.common.entity.BaseEntity;
import com.mybatisflex.core.FlexGlobalConfig;
import com.mybatisflex.core.mybatis.FlexConfiguration;
import com.zaxxer.hikari.HikariDataSource;
import org.apache.ibatis.solon.annotation.Db;
import org.noear.solon.annotation.Bean;
import org.noear.solon.annotation.Configuration;
import org.noear.solon.annotation.Inject;

import javax.sql.DataSource;


/**
 * mybatis-flex配置类
 *
 * @author hans
 */
@Configuration
public class FlexConfig {
    //typed=true，表示默认数据源。@Db 可不带名字注入
    @Bean(value = "db", typed = true)
    public DataSource db(@Inject("${postgres.db}") HikariDataSource ds) {
        return ds;
    }

    //调整 db1 的配置（如：增加插件）// (配置可以解决的，不需要这块代码)
    @Bean
    public void db1_cfg(@Db FlexConfiguration cfg,
                        @Db FlexGlobalConfig globalConfig) {

        //1.初始化数据填充器
        PoemFlexImpl poemFlex = new PoemFlexImpl();
        initListener(globalConfig,poemFlex);
//        DialectFactory.registerDialect(globalConfig.getDbType(),poemFlex);
    }

    /**
     * 初始化字段填充器
     */
    private void initListener(FlexGlobalConfig globalConfig,PoemFlexImpl poemFlex){

        //为 BaseEntity 注册 insertListner
        globalConfig.registerInsertListener(poemFlex, BaseEntity.class);

        //为 BaseEntity 注册 updateListener
        globalConfig.registerUpdateListener(poemFlex, BaseEntity.class);
    }
}
