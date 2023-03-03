--- query di interrogazione--
select codice_dipartimento,
monthname(data_domanda) as mese,
dayofmonth(data_domanda) as giorno,
year(data_domanda)as anno
from partecipa_corsomaster
where partecipa_corsomaster.matricola_studente < 10;


select codice_master,data_pubblicazione,data_scadenza,num_posti_disponibili
from concorso_master
where num_posti_disponibili <='2000'
group by codice_master;

select codice,matricola_studente,voto
from esame
where voto <>'24'
group by codice;

select count(codice),voto
from esame
group by voto
having count(codice) <1001
ORDER BY count(codice) DESC;

select count(matricola_studente),voto
from esame
group by voto
having count(matricola_studente) <>5
ORDER BY count(matricola_studente) DESC;

select count(matricola_studente),voto
from esame
group by voto
having count(matricola_studente)<=5
ORDER BY count(matricola_studente)asc;

select dipartimento.nome_dipartimento,docente.nome
from dipartimento
join docente on dipartimento.matricola_docente=docente.matricola;

select dipartimento.nome_dipartimento,docente.nome
from dipartimento
left join docente on dipartimento.matricola_docente=docente.matricola;

select concorso_master.num_posti_disponibili,data_pubblicazione,data_scadenza,partecipa_corsomaster.matricola_studente
from concorso_master
right join partecipa_corsomaster on concorso_master.codice_master=partecipa_corsomaster.codice_master
where num_posti_disponibili = 2000;

select dipartimento.codice_dipartimento,nome_dipartimento,settore_scientifico,docente.nome
from dipartimento
right outer join docente on dipartimento.matricola_docente=docente.matricola
where nome like'l%' ;

select matricola_studente,data_esame,voto
from esame 
where voto between '22' and '25';