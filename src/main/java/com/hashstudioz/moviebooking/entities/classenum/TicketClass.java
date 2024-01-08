package com.hashstudioz.moviebooking.entities.classenum;

public enum TicketClass {
    CLASSIC(250.0),
    EXECUTIVE(350.0),
    LOUNGE(500.0);

    private final double price;

    TicketClass(double price) {
        this.price = price;
    }

    public double getPrice() {
        return this.price;
    }
}
