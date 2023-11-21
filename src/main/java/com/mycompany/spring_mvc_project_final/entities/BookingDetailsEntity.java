package com.mycompany.spring_mvc_project_final.entities;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "bookingdetails")
public class BookingDetailsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "checkinDate")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date checkinDate;

    @Column(name = "checkoutDate")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date checkoutDate;

    @Column(name ="numOfAdult")
    private double numOfAdult;
    @Column(name ="numOfChild")
    private double numOfChild;

    @Column(name = "numOfPeople")
    private int numOfPeople;

    @ManyToOne
    @JoinColumn(name = "categoryId")
    private CategoryEntity category;

    @ManyToOne
    @JoinColumn(name = "bookingId")
    private BookingEntity booking;

    public BookingDetailsEntity(){
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getCheckinDate() {
        return checkinDate;
    }

    public void setCheckinDate(Date checkinDate) {
        this.checkinDate = checkinDate;
    }

    public Date getCheckoutDate() {
        return checkoutDate;
    }

    public void setCheckoutDate(Date checkoutDate) {
        this.checkoutDate = checkoutDate;
    }

    public double getNumOfAdult() {
        return numOfAdult;
    }

    public void setNumOfAdult(double numOfAdult) {
        this.numOfAdult = numOfAdult;
    }

    public double getNumOfChild() {
        return numOfChild;
    }

    public void setNumOfChild(double numOfChild) {
        this.numOfChild = numOfChild;
    }

    public int getNumOfPeople() {
        return numOfPeople;
    }

    public void setNumOfPeople(int numOfPeople) {
        this.numOfPeople = numOfPeople;
    }

    public CategoryEntity getCategory() {
        return category;
    }

    public void setCategory(CategoryEntity category) {
        this.category = category;
    }

    public BookingEntity getBooking() {
        return booking;
    }

    public void setBooking(BookingEntity booking) {
        this.booking = booking;
    }
}
