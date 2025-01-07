package com.spring.javaGroupS6.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.javaGroupS6.vo.MainCategoryVO;
import com.spring.javaGroupS6.vo.ReviewLikesVO;
import com.spring.javaGroupS6.vo.ShopReviewVO;
import com.spring.javaGroupS6.vo.ShopVO;
import com.spring.javaGroupS6.vo.SubCategoryVO;

public interface ShopDAO {

	ArrayList<ShopVO> getShopList(@Param("category") String category, @Param("column") String column, @Param("accept") String accept, @Param("company") String company);

	ArrayList<Integer> getSubCateCnt(@Param("mainCategory") String mainCategory);

	ArrayList<Integer> getBrandCateCnt(@Param("subCategory") String subCategory);

	ShopVO getShopContent(@Param("idx") int idx);

	ArrayList<ShopVO> getList();

	int setShopUpdate(@Param("vo") ShopVO vo);

	int shopInput(@Param("vo") ShopVO vo);

	int getPostCount(@Param("mid") String mid);

	int setShopDelete(@Param("idx") int idx);

	ArrayList<MainCategoryVO> getMainCategoryList(@Param("category") String category);

	ArrayList<SubCategoryVO> getSubCategoryList(@Param("mainCategory") String mainCategory);

	ArrayList<String> getCategoryList();

	Double getReviewAverage(@Param("idx") int idx);

	ArrayList<ShopReviewVO> getReview(@Param("idx") int idx);

	int setReviewInput(@Param("vo") ShopReviewVO vo, @Param("idx") int idx, @Param("mid") String mid);

	void setPointUp(@Param("mid") String mid, @Param("point") String point);

	void setReviewGoodCheck(@Param("idx") int idx);

	int setReviewGoodInput(@Param("idx") int idx, @Param("reviewIdx") int reviewIdx, @Param("mid") String mid);

	ReviewLikesVO getReviewLikeInfo(@Param("idx") int idx, @Param("mid") String mid);

	ArrayList<Integer> getMyLikes(@Param("idx") int idx, @Param("mid") String mid);

}
