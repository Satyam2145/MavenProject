package com.traffic;

public class TrafficSignalApp {
    public static void main(String[] args) throws Exception {

        while (true) {
            System.out.println("STOP");
            Thread.sleep(2000);
            System.out.println("GO");
            Thread.sleep(2000);
            System.out.println("GET READY");
            Thread.sleep(2000);
        }
    }
}



