package lgg.upload.mapper;

import java.util.List;

import lgg.upload.model.Vodeo;

public interface VodeoMapper {
	public List<Vodeo> queryVodeo(String yonghu);
	public int deleteVodeo(String shipinming);

}
