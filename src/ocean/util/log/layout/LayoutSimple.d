/*******************************************************************************

    Simple Layout to be used with the tango logger

    Copyright:
        Copyright (c) 2009-2016 dunnhumby Germany GmbH.
        All rights reserved.

    License:
        Boost Software License Version 1.0. See LICENSE_BOOST.txt for details.
        Alternatively, this file may be distributed under the terms of the Tango
        3-Clause BSD License (see LICENSE_BSD.txt for details).

*******************************************************************************/

module ocean.util.log.layout.LayoutSimple;

import ocean.text.convert.Formatter;
import ocean.transition;
import ocean.util.log.Appender;
import ocean.util.log.Event;


/*******************************************************************************

   A simple layout, prefixing each message with the log level and
   the name of the logger.

   Example:
   ------
   import ocean.util.log.layout.LayoutSimple;
   import ocean.util.log.Logger;
   import ocean.util.log.AppendConsole;


   Log.root.clear;
   Log.root.add(new AppendConsole(new LayoutSimple));

   auto logger = Log.lookup("Example");

   logger.trace("Trace example");
   logger.error("Error example");
   logger.fatal("Fatal example");
   -----

   Produced output:
   -----
   Trace [Example] - Trace example
   Error [Example] - Error example
   Fatal [Example] - Fatal example
   ----

*******************************************************************************/

public class LayoutSimple : Appender.Layout
{
    /***************************************************************************

        Subclasses should implement this method to perform the formatting
        of the actual message content.

    ***************************************************************************/

    public override void format (LogEvent event, scope FormatterSink dg)
    {
        // format date according to ISO-8601 (lightweight formatter)
        sformat(dg, "{} [{}] -{}", event.levelName, event.name, event);
    }
}
