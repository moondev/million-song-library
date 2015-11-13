package io.swagger.mock;

import io.swagger.model.LoginSuccessResponse;
import io.swagger.model.StatusResponse;

/**
 * Created by anram88 on 11/10/15.
 */
public class LogInMockData {

    LoginSuccessResponse loginMockData = new LoginSuccessResponse();

    public LoginSuccessResponse getSessionToken(String email, String password) {
        String user_UUID = "1A5GA-H45YU-43KJ9IP";
        loginMockData.setSessionToken(user_UUID);
        return loginMockData;
    }

    public StatusResponse logOut () {
        StatusResponse response = new StatusResponse();
        response.setMessage("Successfully logged out");
        return response;
    }

}