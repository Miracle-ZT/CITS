package sfw.xmut.pojo;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/2/1 12:22
 **/
public class Brand {
    private Integer brandId;
    private String brandName;

    @Override
    public String toString() {
        return "Brand{" +
                "brandId=" + brandId +
                ", brandName='" + brandName + '\'' +
                '}';
    }

    public Integer getBrandId() {
        return brandId;
    }

    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }
}
