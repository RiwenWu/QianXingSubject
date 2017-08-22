package com.wrw.qianxingsubject.org.service;

import com.wrw.qianxingsubject.org.dto.AdministratorDTO;
import com.wrw.qianxingsubject.org.entity.Administrator;

public interface AdministratorService {

	public Administrator login(AdministratorDTO adminDTO);
}
