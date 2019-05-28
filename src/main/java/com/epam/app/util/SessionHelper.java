package com.epam.app.util;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SessionHelper {
    private static final HashMap<Integer, List<HttpSession>> sessions = new HashMap<>();

    private SessionHelper() {
    }

    public static void registerSession(int id, HttpSession session) {
        final List<HttpSession> httpSessions = sessions.get(id);
        if (httpSessions == null) {
            List<HttpSession> newSessions = new ArrayList<>();
            newSessions.add(session);
            sessions.put(id, newSessions);
        } else {
            httpSessions.add(session);
        }
    }

    public static void endUserSessions(int id) {
        final List<HttpSession> removed = sessions.remove(id);
        if (removed != null) {
            for (HttpSession r : removed) {
                r.invalidate();
            }
        }
    }

    public static void endSession(int id, HttpSession session) {
        final List<HttpSession> userSessions = sessions.get(id);
        userSessions.removeIf(s -> s.getId().equals(session.getId()));
        session.invalidate();
    }

    public static void printSessions() {
        System.out.println("ACTIVE SESSIONS: ");
        for (Map.Entry<Integer, List<HttpSession>> entry : sessions.entrySet()) {
            System.out.println("user id: " + entry.getKey());
            System.out.println("sessions: ");
            for (HttpSession session : entry.getValue()) {
                System.out.println(session.getId());
            }
        }
    }
}
