package com.epam.app.model;

import com.epam.app.model.enums.Role;
import lombok.*;

@NoArgsConstructor
@AllArgsConstructor

public class User {
    private int id;
    private String name;
    private Role role;
    private String login;
    private String password;

    public User(String name, Role role, String login, String password) {
        this.name = name;
        this.role = role;
        this.login = login;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Role getRole() {
        return role;
    }

    public String getLogin() {
        return login;
    }

    public String getPassword() {
        return password;
    }
//    public static class UserBuilder {
//        private int id;
//        private String name;
//        private Role role;
//        private String login;
//        private String password;
//
//        public UserBuilder(int id, String name, Role role, String login, String password) {
//            this.id = id;
//            this.name = name;
//            this.role = role;
//            this.login = login;
//            this.password = password;
//        }
//    }
//
//        private User(UserBuilder builder) {
//            this.id = builder.id;
//            this.name = builder.name;
//            this.role = builder.role;
//            this.login = builder.login;
//            this.password = builder.password;
//        }

}
