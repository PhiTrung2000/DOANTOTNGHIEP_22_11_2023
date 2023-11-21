package com.mycompany.spring_mvc_project_final.entities;

import javax.persistence.*;

@Entity
@Table(name = "serviceDetails")
public class ServiceDetailsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name ="id")
    private int id;

    @Column(name = "quantity")
    private double quantity;

    @ManyToOne
    @JoinColumn(name = "bookingId")
    private BookingEntity booking;

    @ManyToOne
    @JoinColumn(name = "serviceId")
    private ServiceEntity service;

    public ServiceDetailsEntity(){
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getQuantity() {
        return quantity;
    }

    public void setQuantity(double quantity) {
        this.quantity = quantity;
    }

    public BookingEntity getBooking() {
        return booking;
    }

    public void setBooking(BookingEntity booking) {
        this.booking = booking;
    }

    public ServiceEntity getService() {
        return service;
    }

    public void setService(ServiceEntity service) {
        this.service = service;
    }
}
