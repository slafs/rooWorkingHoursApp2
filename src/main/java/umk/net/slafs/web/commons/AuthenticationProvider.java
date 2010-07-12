package umk.net.slafs.web.commons;

import org.springframework.dao.DataAccessException;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import umk.net.slafs.domain.Pracownik;

public class AuthenticationProvider extends DaoAuthenticationProvider {
	
	public AuthenticationProvider() {
		setUserDetailsService(new UserDetailsService() {
			
			@Override
			public UserDetails loadUserByUsername(String username)
					throws UsernameNotFoundException, DataAccessException {
				
				Pracownik p = Pracownik.findPracownikByUsername(username);
				User u = new User(p.getUsername(), p.getPassword(), p.getEnabled(), true, true, true, new GrantedAuthority[]{ new GrantedAuthorityImpl(p.getAuthority())});
				return u;
			}
		});
	}
}
