package com.epam.app.util;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

/**
 * Created by vladd on 13.05.2019
 */
public class SessionHelper {
    public static final HashMap<Integer, HttpSession> sessions = new HashMap<>();
}
