/*
*
* tutaj tworzenie repozytorium konkretnego; repozytorium bedzie wykorzystywalo BsxApiService do pobierania danych
* w invoice service beda metody zwiazane z fakturami - przejrzec kod php
*
* dodatkowo taki service tworzy repository do operowania na danych tego typu
*
* dodatkowo istnieje model danych,np invoice, ktory ma metody oodpowiednie dla modelu danych
*
* dodatkowo istnieje bsx api service - kazda instancja pozwala na komunikację w obrebie sesji - bsx api service
* tworzy taka sesje i pozwala operowac w jej obrębie
*
* zapamietywanie danych: klucz, uzytkownik i haslo; jesli zapamietany tylko klucz - loguemy do chmury; jesli uzytkownik tez,
* to logujemy od razu na uzytkownika
* */

import 'bsx_module_service.dart';

//class InvoicesModuleService extends BsxModuleService {}