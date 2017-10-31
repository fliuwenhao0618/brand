package edu.zzuli.brand.pojo.po;

public class Chcategory {
    private String chid;

    private String chname;

    private String cid;

    public String getChid() {
        return chid;
    }

    public void setChid(String chid) {
        this.chid = chid == null ? null : chid.trim();
    }

    public String getChname() {
        return chname;
    }

    public void setChname(String chname) {
        this.chname = chname == null ? null : chname.trim();
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid == null ? null : cid.trim();
    }
}