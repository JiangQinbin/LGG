package lgg.upload.mapper;

import lgg.upload.model.NongHu;

public interface OpenShopMapper {
	public int updateUserTable(String username);
    public int insertNongHu(NongHu nonghu);
}
