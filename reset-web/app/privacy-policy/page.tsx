import Head from "next/head";

const PrivacyPolicy = () => {
  return (
    <div className="px-5 py-10 max-w-3xl mx-auto">
      <Head>
        <title>Privacy Policy - Reset</title>
      </Head>
      <main>
        <h1 className="text-3xl font-bold mb-5">Privacy Policy</h1>
        <p className="mb-4">
          This privacy policy applies to the Reset app (referred to as
          "Application") for mobile devices, created by Rupal Totale (referred
          to as "Service Provider") as a free service. This service is provided
          "AS IS".
        </p>

        <h2 className="text-2xl font-semibold mt-6 mb-3">
          Information Collection
        </h2>
        <p className="mb-4">
          The Application may collect information when you download and use it,
          including:
        </p>
        <ul className="list-disc list-inside mb-4">
          <li>Your device's Internet Protocol (IP) address</li>
          <li>
            The pages of the Application you visit, including the time and date
            of your visit, and the duration spent on those pages
          </li>
          <li>The operating system used on your mobile device</li>
        </ul>
        <p className="mb-6">
          The Application does not collect precise location information about
          your mobile device.
        </p>

        <h2 className="text-2xl font-semibold mt-6 mb-3">Information Use</h2>
        <p className="mb-4">
          Any information collected by the Reset application is used to enhance
          and improve your user experience.
        </p>

        {/* <h2 className="text-2xl font-semibold mt-6 mb-3">Third Party Access</h2>
        <p className="mb-4">
          Aggregated, anonymized data is periodically transmitted to external
          services to aid the Service Provider in improving the Application.
          Third-party services used by the Application have their own privacy
          policies:
        </p> */}
        {/* <ul className="list-disc list-inside mb-6">
          <li>
            <a
              href="https://support.google.com/admob/answer/6128543?hl=en"
              target="_blank"
              rel="noopener noreferrer"
              className="text-blue-500 hover:underline"
            >
              AdMob
            </a>
          </li>
          <li>
            <a
              href="https://firebase.google.com/support/privacy"
              target="_blank"
              rel="noopener noreferrer"
              className="text-blue-500 hover:underline"
            >
              Google Analytics for Firebase
            </a>
          </li>
          <li>
            <a
              href="https://firebase.google.com/support/privacy/"
              target="_blank"
              rel="noopener noreferrer"
              className="text-blue-500 hover:underline"
            >
              Firebase Crashlytics
            </a>
          </li>
          <li>
            <a
              href="https://www.revenuecat.com/privacy"
              target="_blank"
              rel="noopener noreferrer"
              className="text-blue-500 hover:underline"
            >
              RevenueCat
            </a>
          </li>
        </ul> */}
        <p className="mb-6">
          The Service Provider may disclose user-provided and automatically
          collected information:
        </p>
        <ul className="list-disc list-inside mb-4">
          <li>
            As required by law, such as to comply with a subpoena or similar
            legal process
          </li>
          <li>
            When believed in good faith that disclosure is necessary to protect
            their rights, your safety or the safety of others, investigate
            fraud, or respond to a government request
          </li>
          <li>
            With trusted service providers who work on their behalf, do not have
            an independent use of the disclosed information, and have agreed to
            adhere to this privacy policy
          </li>
        </ul>

        <h2 className="text-2xl font-semibold mt-6 mb-3">Opt-Out Rights</h2>
        <p className="mb-6">
          You can stop all information collection by the Application by
          uninstalling it. Use the standard uninstall processes available as
          part of your mobile device or via the mobile application marketplace
          or network.
        </p>

        <h2 className="text-2xl font-semibold mt-6 mb-3">
          Data Retention Policy
        </h2>
        <p className="mb-6">
          The Service Provider will retain user-provided data for as long as you
          use the Application and for a reasonable time thereafter. To request
          deletion of user-provided data, contact the Service Provider at{" "}
          <a
            href="mailto:reset_app@outlook.com"
            className="text-blue-500 hover:underline"
          >
            reset_app@outlook.com
          </a>
          .
        </p>

        {/* <h2 className="text-2xl font-semibold mt-6 mb-3">Children</h2>
        <p className="mb-4">
          The Application does not address anyone under the age of 13. The
          Service Provider does not knowingly collect personally identifiable
          information from children under 13 years of age. If a child under 13
          has provided personal information, the Service Provider will delete it
          from their servers. If you are a parent or guardian aware that your
          child has provided personal information, contact the Service Provider
          at{" "}
          <a
            href="mailto:reset_app@outlook.com"
            className="text-blue-500 hover:underline"
          >
            reset_app@outlook.com
          </a>
          .
        </p> */}

        <h2 className="text-2xl font-semibold mt-6 mb-3">Security</h2>
        <p className="mb-6">
          The Service Provider safeguards the confidentiality of your
          information through physical, electronic, and procedural safeguards.
        </p>

        <h2 className="text-2xl font-semibold mt-6 mb-3">Changes</h2>
        <p className="mb-6">
          This Privacy Policy may be updated from time to time. The Service
          Provider will notify you of any changes by updating this page.
          Continued use of the Application constitutes your consent to the
          updated Privacy Policy.
        </p>
        <p className="mb-6">
          This privacy policy is effective as of 2024-06-27.
        </p>

        <h2 className="text-2xl font-semibold mt-6 mb-3">Your Consent</h2>
        <p className="mb-6">
          By using the Application, you consent to the processing of your
          information as described in this Privacy Policy.
        </p>

        <h2 className="text-2xl font-semibold mt-6 mb-3">Contact Us</h2>
        <p className="mb-6">
          If you have any questions or suggestions about the Terms and
          Conditions, please contact the Service Provider at{" "}
          <a
            href="mailto:reset_app@outlook.com"
            className="text-blue-500 hover:underline"
          >
            reset_app@outlook.com
          </a>
          .
        </p>
        <hr className="mb-6" />
        <p className="text-gray-500">
          This privacy policy page was generated with the help of{" "}
          <a
            href="https://app-privacy-policy-generator.nisrulz.com/"
            target="_blank"
            rel="noopener noreferrer"
            className="text-blue-500 hover:underline"
          >
            App Privacy Policy Generator
          </a>
          .
        </p>
      </main>
    </div>
  );
};

export default PrivacyPolicy;
