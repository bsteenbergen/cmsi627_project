;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  File name  : Eventify.clp
;;;  Purpose    : This CLIPS source file runs a program to determine a
;;;               location for the user based on their answers to 
;;;               specific questions about their needs.
;;;  Project    : CMSI 627
;;;  Date       : 14-Feb-2024
;;;  Author     : Brittany, Christine, Alejandro, Subhraneel
;;;  Description: This program is just a simple question-and-answer
;;;                session, which will tell the user an event that they
;;;                can attend based on their specifications.
;;;
;;;  Operation  : This source file is intended to be run from the batch
;;;                file with the corresponding name.  To do this, in
;;;                the CLIPS environment, use the command:
;;;
;;;                   (batch Eventify.bat)
;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Revision History:
;;;  -----------------
;;;
;;;   Ver      Date      Modified by:  Description
;;;  -----  -----------  ------------  ---------------------------------
;;;  1.0.0  14-Feb-2024  Brittany S.   Initial release
;;;  1.0.1  18-Feb-2024  Subhraneel P. Added a template for location & added locations as facts
;;;  1.0.2  12-Mar-2024  Christine L.  Added rules 
;;;  1.0.3  20-Mar-2024  Subhraneel P. Added rules to validate the user inputs 
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a template for a location, containing slots for its 
;;;  pertinent information.
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (deftemplate location
        (slot name (type STRING))
        (slot address (type STRING))
        (slot hours)
        (slot website)
        (slot description (type STRING))
        (slot region)
        (multislot price_range)
        (slot group_size)
        (multislot energy_range)
        (slot foodAvailable)
        (slot alcoholAvailable)
        (slot musicAvailable)
        (slot wheelchairAccessible)
        (slot category)
        (slot isIndoor)
    )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a list of locations, containing the appropriate attribute 
;;;  data
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (deffacts location-database 
       (location (name "Boardwalk11")
                      (address "10433 National Blvd Los Angeles, CA 90034")
                      (hours 5:00pm-2:00am)
                      (website Boardwalk11.com)
                      (description "indoor")
                      (region SoCal)
                      (price_range medium)
                      (group_size any)
                      (energy_range medium)
                      (foodAvailable yes)
                      (alcoholAvailable yes)
                      (musicAvailable yes)
                      (wheelchairAccessible yes)
                      (category casual)
                      (isIndoor true)
       )
       (location (name "The Grove")
                      (address "189 The Grove Dr, Los Angeles CA 90036")
                      (hours 10:00am-9:00pm)
                      (website Thegrovela.com)
                      (description "Retail and entertainment complex in Los Angeles.")
                      (region SoCal)
                      (price_range medium high)
                      (group_size any)
                      (energy_range medium)
                      (foodAvailable yes)
                      (alcoholAvailable yes)
                      (musicAvailable yes)
                      (wheelchairAccessible yes)
                      (category casual)
                      (isIndoor false)
       )
       (location (name "Pier 39")
                      (address "The embarcadero, San Francisco CA 94133")
                      (hours 11:00am-9:00pm)
                      (website Pier39.com)
                      (description "Shopping center with attractions and live shows")
                      (region Bay-area)
                      (price_range low medium)
                      (group_size any)
                      (energy_range medium high)
                      (foodAvailable yes)
                      (alcoholAvailable yes)
                      (musicAvailable no)
                      (wheelchairAccessible yes)
                      (category casual)
                      (isIndoor false)
       )
       (location (name "Golden Gate Park")
                      (address "501 Stanyan St, San Francisco CA 94117")
                      (hours 6:00am-10:00pm)
                      (website Sfrecpark.org)
                      (description "Large urban park consisting of 1,017 acres of public grounds")
                      (region Bay-area)
                      (price_range low medium)
                      (group_size any)
                      (energy_range low medium)
                      (foodAvailable no)
                      (alcoholAvailable no)
                      (musicAvailable no)
                      (wheelchairAccessible yes)
                      (category casual)
                      (isIndoor false)
       )
       (location (name "BigFoot West")
                      (address "10939 Venice Blvd, Los Angeles, CA 90064")
                      (hours 5pm-2am)
                      (website 1933group.com/bigfoot-west)
                      (description "A friendly neighborhood bar with a 'Cheers'-like sensibility, this cozy log cabin transports eager Angelenos to grandpa's cabin at story time")
                      (region SoCal)
                      (price_range low)
                      (group_size any)
                      (energy_range medium)
                      (foodAvailable yes)
                      (alcoholAvailable yes)
                      (musicAvailable yes)
                      (wheelchairAccessible yes)
                      (category casual)
                      (isIndoor true)
       )
       (location (name "The Fillmore")
                      (address "1805 Geary Blvd, San Francisco, CA 94115")
                      (hours 10am-6pm)
                      (website livenation.com/venue/KovZpZAE6eeA/the-fillmore-events)
                      (description "The Fillmore is a historic music venue in San Francisco, California")
                      (region Bay-area)
                      (price_range high)
                      (group_size any)
                      (energy_range medium)
                      (foodAvailable no)
                      (alcoholAvailable no)
                      (musicAvailable yes)
                      (wheelchairAccessible yes)
                      (category casual)
                      (isIndoor true)
       )
       (location (name "Manhattan Beach Pier")
                      (address "2 Manhattan Beach Blvd, Manhattan Beach, CA 90266")
                      (hours 24hrs)
                      (website manhattanbeach.gov)
                      (description "Manhattan Beach Pier is a real gem to photograph as it has a photogenic red-roofed roundhouse at the end of it and turquoise colored steel railings running the length of it. Palm trees line the parking lot at the start of the pier to complete the scene")
                      (region SoCal)
                      (price_range low)
                      (group_size any)
                      (energy_range low)
                      (foodAvailable no)
                      (alcoholAvailable no)
                      (musicAvailable no)
                      (wheelchairAccessible yes)
                      (category casual)
                      (isIndoor false)
       )
       (location (name "Universal CityWalk")
                      (address "100 Universal City Plaza, Universal City, CA 91608")
                      (hours 11am-9pm)
                      (website universalstudioshollywood.com/web/en/us/things-to-do/lands/citywalk)
                      (description "Shops, bars and restaurants")
                      (region SoCal)
                      (price_range medium)
                      (group_size 30)
                      (energy_range high)
                      (foodAvailable yes)
                      (alcoholAvailable yes)
                      (musicAvailable yes)
                      (wheelchairAccessible yes)
                      (category casual)
                      (isIndoor false)
       )
       (location (name "Oak Grove")
                      (address "3067 E Chevy Chase Drive, Glendale")
                      (hours request)
                      (website thebash.com/profiles/chevy-chase-country-club-oak-grove)
                      (description "private venue outdoors")
                      (region SoCal)
                      (price_range medium)
                      (group_size 40)
                      (energy_range low)
                      (foodAvailable yes)
                      (alcoholAvailable yes)
                      (musicAvailable request)
                      (wheelchairAccessible yes)
                      (category casual)
                      (isIndoor false)
       )
       (location (name "K1 Indoor Karting Burbank")
                      (address "960 Chestnut st., Burbank, CA 91506")
                      (hours 12pm-10pm)
                      (website k1speed.com/burbank-location.html)
                      (description "Karting for kids and adults, 1 challening indoor track and space for a fun or formal event")
                      (region SoCal)
                      (price_range high)
                      (group_size 40)
                      (energy_range high)
                      (foodAvailable request)
                      (alcoholAvailable request)
                      (musicAvailable no)
                      (wheelchairAccessible yes)
                      (category casual)
                      (isIndoor true)
       )
       (location (name "Academy")
                      (address "6021 Hollywood Blvd, Los Angeles, CA 90028")
                      (hours request)
                      (website academy.la)
                      (description "")
                      (region SoCal)
                      (price_range medium)
                      (group_size Any)
                      (energy_range high)
                      (foodAvailable no)
                      (alcoholAvailable yes)
                      (musicAvailable yes)
                      (wheelchairAccessible yes)
                      (category casual)
                      (isIndoor true)
       )
       (location (name "Bubble World")
                      (address "1345 N. Montebello Boulevard, Montebello")
                      (hours 10am-9pm)
                      (website bubbleworldexperience.com/los-angeles/)
                      (description "Discover uniquely-themed rooms with plenty of photo opportunities in ball pits, VR tech, hot air balloon simulators and illusions")
                      (region SoCal)
                      (price_range medium)
                      (group_size Any)
                      (energy_range medium high)
                      (foodAvailable request)
                      (alcoholAvailable request)
                      (musicAvailable request)
                      (wheelchairAccessible yes)
                      (category casual)
                      (isIndoor true)
       )
   )
;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to determine the group size from the user
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule get-group_size 
      (not (group_size ?))
   =>
      (printout t "What is your group size? "crlf
                  "(number or 'Any')" crlf
                  "   [Enter] =>")
      (assert (group_size (read)))
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to determine the price_range range from the user
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule get-price_range
      (not (price ?))
   =>   
      (printout t "What is your price range?" crlf
                  "(low, medium, high)" crlf
                  "   [Enter] =>")
      (assert (price (read)))
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to determine the energy_range level from the user
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   
   (defrule get-energy_range
      (not (energy ?))   
   =>   
      (printout t "What energy level are you looking for?" crlf
                  "(low, medium, high)" crlf
                  "   [Enter] =>")
      (assert (energy (read)))
   )
;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to accept the region from the user
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule get-region
      (not (region ?))
   =>   
      (printout t "What is region of your event?" crlf
                  "(NorCal, SoCal, Bay Area)" crlf
                  "   [Enter] =>")
      (assert (region (read)))
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to accept the category from the user
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule get-category
      (not (category ?))
   =>   
      (printout t "What is the category of your event?" crlf
                  "(formal, casual)" crlf
                  "   [Enter] =>")
      (assert (category (read)))
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to determine if the venue is indoor or outdoor from the user
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule get-isIndoor
      (not (isIndoor ?))
   =>   
      (printout t "Do you want the venue to be indoor?" crlf
                  "(true, false)" crlf
                  "   [Enter] =>")
      (assert (isIndoor (read)))
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to determine if food is required by the user
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule get-foodAvailable
      (not (foodAvailable ?))
   =>   
      (printout t "Do you need food to be available at the venue?" crlf
                  "(yes, no, request)" crlf
                  "   [Enter] =>")
      (assert (foodAvailable (read)))
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to determine if alcohol is required by the user
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule get-alcoholAvailable
      (not (alcoholAvailable ?))
   =>   
      (printout t "Do you need alcohol to be available at the venue?" crlf
                  "(yes, no, request)" crlf
                  "   [Enter] =>")
      (assert (alcoholAvailable (read)))
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to determine if music is required the user
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule get-musicAvailable
      (not (musicAvailable ?))
   =>   
      (printout t "Do you need music to be available at the venue?" crlf
                  "(yes, no, request)" crlf
                  "   [Enter] =>")
      (assert (musicAvailable (read)))
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to determine if the user wants 
;;;   wheelchair accessibility at the venue
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule get-wheelchairAccessible
      (not (wheelchairAccessible ?))
   =>   
      (printout t "do you need wheechair accessibility at the venue?" crlf
                  "(yes, no)" crlf
                  "   [Enter] =>")
      (assert (wheelchairAccessible (read)))
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to to throw out wrong price range value so that 
;;;   user have to enter valid data
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule bad-price-entry "Ditch bogus price entries"
       ?f <- (price ~low & ~medium & ~high)
      =>
       (retract ?f)
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to to throw out wrong energy value so that 
;;;   user have to enter valid data
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule bad-energy-entry "Ditch bogus energy entries"
       ?f <- (energy ~low & ~medium & ~high)
      =>
       (retract ?f)
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to to throw out wrong region value so that 
;;;   user have to enter valid data
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule bad-region-entry "Ditch bogus region entries"
       ?f <- (region ~SoCal & ~NorCal & ~Bay-area)
      =>
       (retract ?f)
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to to throw out wrong category value so that 
;;;   user have to enter valid data
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule bad-category-entry "Ditch bogus category entries"
       ?f <- (category ~formal & ~casual)
      =>
       (retract ?f)
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to to throw out wrong isIndoor value so that  
;;;   user have to enter valid data
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule bad-isIndoor-entry "Ditch bogus isIndoor entries"
       ?f <- (isIndoor ~true & ~false)
      =>
       (retract ?f)
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to to throw out wrong foodAvailable value so that 
;;;   user have to enter valid data
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule bad-foodAvailable-entry "Ditch bogus foodAvailable entries"
       ?f <- (foodAvailable ~yes & ~no & ~request)
      =>
       (retract ?f)
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to to throw out wrong musicAvailable value so that 
;;;   user have to enter valid data
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule bad-musicAvailable-entry "Ditch bogus musicAvailable entries"
       ?f <- (musicAvailable ~yes & ~no & ~request)
      =>
       (retract ?f)
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to to throw out wrong alcoholAvailable value so that 
;;;   user have to enter valid data
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule bad-alcoholAvailable-entry "Ditch bogus alcoholAvailable entries"
       ?f <- (alcoholAvailable ~yes & ~no & ~request)
      =>
       (retract ?f)
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to to throw out wrong wheelchairAccessible value so that
;;;   user have to enter valid data
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule bad-wheelchairAccessible-entry "Ditch bogus wheelchairAccessible entries"
       ?f <- (wheelchairAccessible ~yes & ~no)
      =>
       (retract ?f)
   )

;;;
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;;  Define a rule to output the result of the search
;;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   (defrule print-results
         (price ?price)
         (energy ?energy)
         (group_size ?group_size)
         (region ?region)
         (category ?category)
         (isIndoor ?isIndoor)
         (foodAvailable ?foodAvailable)
         (alcoholAvailable ?alcoholAvailable)
         (musicAvailable ?musicAvailable)
         (wheelchairAccessible ?wheelchairAccessible)
         ?l <- (location   (name ?name)
                     (price_range $? ?price $?)
                     (energy_range $? ?energy $?)
                     (group_size ?group_size)
                     (region ?region)
                  (category ?category)
                  (isIndoor ?isIndoor)
                  (foodAvailable ?foodAvailable)
                  (alcoholAvailable ?alcoholAvailable)
                  (musicAvailable ?musicAvailable)
                  (wheelchairAccessible ?wheelchairAccessible)
         )
         =>
         (if ?l
            then
            (progn
               (printout t crlf crlf)
               (printout t ?l)
               (printout t crlf crlf))
            else
            (printout t "Sorry, no location matches your specification." crlf))
      )





