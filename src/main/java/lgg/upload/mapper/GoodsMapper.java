package lgg.upload.mapper;

import java.util.List;

import lgg.upload.model.MangoPrice;

public interface GoodsMapper {
	public List<MangoPrice> queryGoods(String yonghu);
    public int deleteGoods(String manguoID);
    public MangoPrice queryGood(String manguoID);
    public int updateGoods(MangoPrice manguo);
}
