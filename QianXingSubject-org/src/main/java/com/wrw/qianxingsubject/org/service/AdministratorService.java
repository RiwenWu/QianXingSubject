package com.wrw.qianxingsubject.org.service;

import com.wrw.qianxingsubject.org.entity.Administrator;

public interface AdministratorService {

	public Administrator login(String adminName, String adminPassword);
}
