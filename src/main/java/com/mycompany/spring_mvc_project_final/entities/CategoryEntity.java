package com.mycompany.spring_mvc_project_final.entities;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "category")
public class CategoryEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "price")
    private double price;

    @Column(name ="numOfPeople")
    private double numOfPeople;

    @Column(name = "status")
    private String status;

    @Column(name = "bed")
    private int bed;

    @OneToMany(mappedBy = "category", fetch = FetchType.LAZY)
    private List<RoomEntity> roomEntityList;

    @OneToMany(mappedBy = "category",fetch = FetchType.LAZY)
    private List<BookingDetailsEntity>bookingDetailsEntities;

    public CategoryEntity(){
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getNumOfPeople() {
        return numOfPeople;
    }

    public void setNumOfPeople(double numOfPeople) {
        this.numOfPeople = numOfPeople;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getBed() {
        return bed;
    }

    public void setBed(int bed) {
        this.bed = bed;
    }

    public List<RoomEntity> getRoomEntityList() {
        return roomEntityList;
    }

    public void setRoomEntityList(List<RoomEntity> roomEntityList) {
        this.roomEntityList = roomEntityList;
    }

    public List<BookingDetailsEntity> getBookingDetailsEntities() {
        return bookingDetailsEntities;
    }

    public void setBookingDetailsEntities(List<BookingDetailsEntity> bookingDetailsEntities) {
        this.bookingDetailsEntities = bookingDetailsEntities;
    }
}
