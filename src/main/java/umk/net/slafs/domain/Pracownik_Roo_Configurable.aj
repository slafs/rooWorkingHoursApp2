package umk.net.slafs.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect Pracownik_Roo_Configurable {
    
    declare @type: Pracownik: @Configurable;
    
}
