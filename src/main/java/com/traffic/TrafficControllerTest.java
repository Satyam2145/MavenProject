package com.traffic;

public class TrafficControllerTest {
    public static void main(String[] args) {
        System.out.println(TrafficController.getAction(TrafficController.Signal.RED));
        System.out.println(TrafficController.getAction(TrafficController.Signal.GREEN));
        System.out.println(TrafficController.getAction(TrafficController.Signal.YELLOW));
    }
}
