package edu.sjsu.smartalertcloud;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import org.springframework.security.*;

@Configuration
@EnableWebSecurity
@ComponentScan({"edu.sjsu.smartalertcloud.controller", "edu.sjsu.smartalertcloud.dao", 
"edu.sjsu.smartalertcloud.service","edu.sjsu.smartalertcloud.dao.impl", 
"edu.sjsu.smartalertcloud.service.impl"})
public class SmartAlertCloudSecurityConfiguration extends WebSecurityConfigurerAdapter {
	@Autowired
	@Qualifier("userDetailsService")
	UserDetailsService userDetailsService;
	/*@Autowired
    MyUserDetailsService myUserDetailsService;*/
	
		
    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/resources/**");
    }
    
    @Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
//		auth.userDetailsService(userDetailsService);
	}
/*    
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(myUserDetailsService).passwordEncoder(passwordEncoder());
	}*/

    @Override
    protected void configure(HttpSecurity http) throws Exception {
    	http.authorizeRequests()
    	.antMatchers("/").permitAll()
    	.antMatchers("/signup").permitAll()
    	.antMatchers("/registrationConfirm").permitAll()
    /*	.antMatchers("/home/**").hasAnyRole("USER", "CUSTOMER")
    	.antMatchers("/home**").hasAnyRole("USER", "CUSTOMER")
    	.antMatchers("/home**").hasAnyRole("USER", "CUSTOMER")
        .antMatchers("/home*").hasAnyRole("ADMIN")
        .antMatchers("/home*").hasAnyRole("ADMIN")
        .antMatchers("/home**").hasAnyRole("ADMIN")*/
        .anyRequest().authenticated().and().formLogin()
        .loginPage("/login")
        .defaultSuccessUrl("/home")
        .permitAll().and().logout().permitAll();

        http.csrf().disable();
        
        
     /*   http.authorizeRequests().antMatchers("/admin/**")
		.access("hasRole('ROLE_ADMIN')").and().formLogin()
		.loginPage("/login").failureUrl("/login?error")
			.usernameParameter("username")
			.passwordParameter("password")
			.and().logout().logoutSuccessUrl("/login?logout")
			.and().csrf()
			.and().exceptionHandling().accessDeniedPage("/403");*/
    }

/*   @Autowired
    public void configureGlobal(AuthenticationManagerBuilder authenticationMgr) throws Exception {
      authenticationMgr.inMemoryAuthentication().passwordEncoder(NoOpPasswordEncoder.getInstance()).withUser("employee").password("employee")
            .authorities("ROLE_USER").and().withUser("javainuse").password("javainuse")
            .authorities("ROLE_USER", "ROLE_ADMIN","ROLE_CUSTOMER");
     
    }*/

	@Bean
	public PasswordEncoder passwordEncoder(){
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder;
	}
}