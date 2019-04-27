package com.epam.app.model;

import com.epam.app.model.enums.Role;
import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Data
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
}
