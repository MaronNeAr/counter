package com.example.yin.domain;

public class Contest {

    Integer id;

    String name;

    String credit;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCredit() {
        return credit;
    }

    public void setCredit(String credit) {
        this.credit = credit;
    }

    @Override
    public String toString() {
        return "contest{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", credit='" + credit + '\'' +
                '}';
    }
}
