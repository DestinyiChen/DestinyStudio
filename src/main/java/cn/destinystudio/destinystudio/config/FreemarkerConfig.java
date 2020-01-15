package cn.destinystudio.destinystudio.config;

import freemarker.template.TemplateModelException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

@Configuration
public class FreemarkerConfig {
    @Resource
    private freemarker.template.Configuration configuration;

    @Value("${custom.prod}")
    private boolean prod;

    @PostConstruct
    public void setConfiguration() throws TemplateModelException {
        configuration.setSharedVariable("prod", prod);
    }
}