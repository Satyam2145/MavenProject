package com.traffic;

import java.util.*;

enum color {
    RED, GREEN, YELLOW;
}

public class enumtype {
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
        String input = s.next().toUpperCase();
        color type = color.valueOf(input);

        switch (type) {
            case RED:
                System.out.println("STOP");
                break;
            case GREEN:
                System.out.println("GO");
                break;
            case YELLOW:
                System.out.println("GET READY");
                break;
        }
    }
}

