package com.campusdual.showlive.model.core.dao;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;

@Repository("LocationDao")
@Lazy
@ConfigurationFile(configurationFile = "dao/LocationDao.xml", configurationFilePlaceholder = "dao/placeholders.properties")
public class LocationDao extends OntimizeJdbcDaoSupport {
	 public static final String ATTR_LOCATION_ID = "LOCATION_ID";
	 public static final String ATTR_NAME = "NAME";
	 public static final String ATTR_ADDRES = "ADDRES";
	 public static final String ATTR_CITY = "CITY";
	 public static final String ATTR_PROVINCE = "PROVINCE";
	 public static final String ATTR_ZIP_CODE = "ZIP_CODE";
	 public static final String ATTR_CAPACITY = "CAPACITY";
	 public static final String ATTR_STREAMING_CONCERT_URL = "STREAMING_CONCERT_URL";
}
