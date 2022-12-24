[iaa]
Ubuntu1 ansible_host=${web_public_ip}

[iaa2]
Ubuntu2 ansible_host=${web_public_ip_1}

[iaa3]
Ubuntu3 ansible_host=${web_public_ip_2}

[iaac:children]
iaa
iaa2