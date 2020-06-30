package com.campusdual.showlive.model.core.dao;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;

@Repository("ConcertDao")
@Lazy
@ConfigurationFile(configurationFile = "dao/ConcertDao.xml", configurationFilePlaceholder = "dao/placeholders.properties")
public class ConcertDao extends OntimizeJdbcDaoSupport {

 public static final String ATTR_CONCERT_ID = "CONCERT_ID";
 public static final String ATTR_LOCATION_ID = "LOCATION_ID";
 public static final String ATTR_DATE = "DATE";
 public static final String ATTR_DURATION = "DURATION";
 public static final String ATTR_DESCRIPTION = "DESCRIPTION";
 public static final String ATTR_ADD_DATE = "ADD_DATE";
 public static final String ATTR_VIEWS_COUNT = "VIEWS_COUNT";
 public static final String ATTR_IS_STREAMING = "IS_STREAMING";
 

}