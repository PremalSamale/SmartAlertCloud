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

	
		
    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/resources/**", "/getSensorData");
    }
    
    @Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());

	}


	
    @Override
    protected void configure(HttpSecurity http) throws Exception {
    	http.authorizeRequests()
    	.antMatchers("/").permitAll()
    	.antMatchers("/signup").permitAll()
    	.antMatchers("/registrationConfirm").permitAll()
    	.antMatchers("/home").hasAnyRole("ADMIN", "GUEST","USER","INFRASTRUCTURE_OFFICER")
    	.antMatchers("/dashboard").hasAnyRole("ADMIN", "GUEST","USER","INFRASTRUCTURE_OFFICER")
    	.antMatchers("/sensorDataReport").hasAnyRole("ADMIN", "GUEST","USER","INFRASTRUCTURE_OFFICER")
    	.antMatchers("/clusterLocationView").hasAnyRole("ADMIN", "GUEST","USER","INFRASTRUCTURE_OFFICER")
    	.antMatchers("/sensorMapView").hasAnyRole("ADMIN", "GUEST","USER","INFRASTRUCTURE_OFFICER")
    	.antMatchers("/manageSensor").hasAnyRole("ADMIN", "INFRASTRUCTURE_OFFICER")
    	.antMatchers("/addSensor").hasAnyRole("ADMIN", "INFRASTRUCTURE_OFFICER")
    	.antMatchers("/editSensor").hasAnyRole("ADMIN", "INFRASTRUCTURE_OFFICER")
    	
    	.antMatchers("/manageCluster").hasAnyRole("ADMIN", "INFRASTRUCTURE_OFFICER")
    	
    	.antMatchers("/addCluster").hasAnyRole("ADMIN", "INFRASTRUCTURE_OFFICER")
    	.antMatchers("/editCluster").hasAnyRole("ADMIN", "INFRASTRUCTURE_OFFICER")
    	
    	.antMatchers("/manageNode").hasAnyRole("ADMIN", "INFRASTRUCTURE_OFFICER")
    	.antMatchers("/addNode").hasAnyRole("ADMIN", "INFRASTRUCTURE_OFFICER")
    	.antMatchers("/editNode").hasAnyRole("ADMIN", "INFRASTRUCTURE_OFFICER")
    	
    	.antMatchers("/getRealDataSensor").hasAnyRole("ADMIN", "USER")
    	.antMatchers("/getRealDataTempSensor").hasAnyRole("ADMIN", "USER")
    	.antMatchers("/getLast24hoursData").hasAnyRole("ADMIN", "USER")
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
        

    }
	@Bean
	public PasswordEncoder passwordEncoder(){
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder;
	}
}