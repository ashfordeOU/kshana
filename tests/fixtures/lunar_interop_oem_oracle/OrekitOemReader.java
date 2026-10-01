// SPDX-License-Identifier: AGPL-3.0-only
// Second independent reader for Kshana's lunar CCSDS OEM export: Orekit 12.2
// (Apache-2.0, https://www.orekit.org) OemParser with its default, strict settings.
// Prints, per file, either the decoded header, metadata and states, or the exact
// exception Orekit raises. Kshana is not involved.
//
//   source ~/Code/kshana-oracles/env.sh
//   javac -cp "$OREKIT_CP" -d <scratch> OrekitOemReader.java
//   java -cp "$OREKIT_CP:<scratch>" OrekitOemReader "$OREKIT_DATA" file1.oem file2.oem
import java.io.File;
import java.util.Locale;
import org.orekit.data.DataContext;
import org.orekit.data.DataSource;
import org.orekit.data.DirectoryCrawler;
import org.orekit.files.ccsds.ndm.ParserBuilder;
import org.orekit.files.ccsds.ndm.odm.oem.Oem;
import org.orekit.files.ccsds.ndm.odm.oem.OemMetadata;
import org.orekit.files.ccsds.ndm.odm.oem.OemSegment;
import org.orekit.utils.TimeStampedPVCoordinates;

public class OrekitOemReader {
    public static void main(String[] args) {
        DataContext.getDefault().getDataProvidersManager()
            .addProvider(new DirectoryCrawler(new File(args[0])));
        for (int i = 1; i < args.length; i++) {
            String name = new File(args[i]).getName();
            try {
                Oem oem = new ParserBuilder().buildOemParser().parseMessage(new DataSource(args[i]));
                System.out.println("FILE " + name + " DECODED");
                System.out.println("HEADER " + name + " | " + oem.getHeader().getFormatVersion()
                    + " | " + oem.getHeader().getOriginator());
                for (OemSegment seg : oem.getSegments()) {
                    OemMetadata md = seg.getMetadata();
                    System.out.println("META " + name + " | " + md.getObjectName() + " | " + md.getObjectID()
                        + " | " + md.getCenter().getName() + " | " + md.getReferenceFrame().getName()
                        + " | " + md.getTimeSystem() + " | " + md.getStartTime()
                        + " | " + md.getStopTime());
                    for (TimeStampedPVCoordinates pv : seg.getData().getEphemeridesDataLines()) {
                        System.out.println(String.format(Locale.ROOT,
                            "STATE %s t+%s %.17e %.17e %.17e %.17e %.17e %.17e", name,
                            String.format(Locale.ROOT, "%.6f", pv.getDate().durationFrom(md.getStartTime())),
                            pv.getPosition().getX() / 1000.0, pv.getPosition().getY() / 1000.0,
                            pv.getPosition().getZ() / 1000.0, pv.getVelocity().getX() / 1000.0,
                            pv.getVelocity().getY() / 1000.0, pv.getVelocity().getZ() / 1000.0));
                    }
                }
            } catch (Exception e) {
                System.out.println("FILE " + name + " REFUSED " + e.getClass().getSimpleName()
                    + ": " + e.getMessage());
            }
        }
    }
}
