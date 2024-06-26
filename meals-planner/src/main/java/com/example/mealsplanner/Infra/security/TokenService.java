package com.example.mealsplanner.Infra.security;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTCreationException;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.example.mealsplanner.domain.user.User;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.util.HashSet;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.Set;

@Service
public class TokenService {
    @Value("${api.secrety.token.secret}")
    private String secret;

    private Set<String> tokenBlacklist = new HashSet<>();

    public String generateToken(User user) {
        try {
            Algorithm algorithm =  Algorithm.HMAC256(secret);

            String token = JWT.create()
                    .withIssuer("meals-planner")
                    .withSubject(user.getEmail())
                    .withExpiresAt(this.generateExpirateDate())
                    .sign(algorithm);
            return token;

        } catch (JWTCreationException exception) {
            throw new RuntimeException("Error na autenticação");
        }
    }

    public String validateToken(String token) {
        try {
            Algorithm algorithm = Algorithm.HMAC256(secret);
            return JWT.require(algorithm)
                    .withIssuer("meals-planner")
                    .build()
                    .verify(token)
                    .getSubject();
        } catch (JWTVerificationException exception) {
            return null;
        }
    }

    private Instant generateExpirateDate() {
        return LocalDateTime.now().plusHours(8).toInstant(ZoneOffset.of("-03:00"));
    }

    public void addToBlacklist(String token) {
        tokenBlacklist.add(token);
    }

    public boolean isTokenBlacklisted(String token) {
        return tokenBlacklist.contains(token);
    }
}
