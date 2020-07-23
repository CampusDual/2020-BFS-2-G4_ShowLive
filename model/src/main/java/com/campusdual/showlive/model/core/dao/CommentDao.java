package com.campusdual.showlive.model.core.dao;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;

@Repository("CommentDao")
@Lazy
@ConfigurationFile(configurationFile = "dao/CommentDao.xml", configurationFilePlaceholder = "dao/placeholders.properties")
public class CommentDao extends OntimizeJdbcDaoSupport {

 public static final String ATTR_COMMENTS_ID = "comments_id";
 public static final String ATTR_CONCERT_ID = "concert_id";
 public static final String ATTR_NAME_COMMENT = "name_comment";
 public static final String ATTR_DATE_COMMENT = "date_comment";
 public static final String ATTR_CONTENT = "content";
 
}