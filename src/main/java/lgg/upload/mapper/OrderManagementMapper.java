package lgg.upload.mapper;

import java.util.List;

import lgg.upload.model.NonghuOrder;

public interface OrderManagementMapper {
	public List<NonghuOrder> quaryOrder(String honghu);
	public int orderUpdate(String ordernumber);

}
