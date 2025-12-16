package com.traffic;

public class TrafficController {

    enum Signal {
        RED, YELLOW, GREEN
    }

    public static String getAction(Signal signal) {
        switch (signal) {
            case RED:
                return "STOP";
            case GREEN:
                return "GO";
            case YELLOW:
                return "GET READY";
            default:
                return "INVALID";
        }
    }
}
