import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sell_cycle_app/model/news_item.dart';
import 'package:sell_cycle_app/pages/description_news_page.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<NewsItem> newsList = [
    NewsItem(
        title:
            'They Grow Your Berries and Peaches, but Often Lack One Item: Insurance',
        text:
            'Farmers who grow fresh fruits and vegetables are often finding crop insurance prohibitively expensive — or even unavailable — as climate change escalates the likelihood of drought and floods capable of decimating harvests. Their predicament has left some small farmers questioning their future on the land. Efforts to increase the availability and affordability of crop insurance are being considered in Congress as part of the next farm bill, but divisions between the interests of big and small farmers loom over the debate. The threat to farms from climate change is not hypothetical. A 2021 study from researchers at Stanford University found that rising temperatures were responsible for 19 percent of the \$27 billion in crop insurance payouts from 1991 to 2017 and concluded that additional warming substantially increases the likelihood of future crop losses. About 85 percent of the nation’s commodity crops — which include row crops like corn, soybeans and wheat — are insured, according to the National Sustainable Agriculture Coalition, a nonprofit promoting environmentally friendly food production.',
        image:
            'https://static01.nyt.com/images/2024/03/19/multimedia/00crop-insurance-gjlh/00crop-insurance-gjlh-superJumbo.jpg?quality=75&auto=webp',
        date: '27 march, 2024'),
    NewsItem(
        title: 'Happy-Go-Lucky Australia Is Feeling Neither Happy, Nor Lucky',
        text:
            'For nearly three decades, Australia seemed to have a sort of get-out-of-jail card that allowed it to glide through the dot-com bust and the global financial crisis without a recession, while its citizens mostly enjoyed high wages, affordable housing and golden prospects. When a recession did arrive, in 2020, it was because of the Covid-19 pandemic. But four years later, Australia has been unable to shake off some of the headwinds, including a high cost of living — the price of bread has risen 24 percent since 2021 — a choppy labor market and rising inequality. While these and similar issues are also troubling nations like Britain and the United States, they are particularly stinging to many in Australia, which has long seen itself as the “lucky country.” Australia is among the wealthiest, most resource-rich and stable countries in the world. But millions of residents are experiencing levels of hardship not seen in many decades. They say they are struggling to put food on the table, pay for housing and health care and cover their utility bills. And many young Australians are confronting a reality that their ancestors never had to: that they will be worse off than their parents or grandparents. Robyn Northam, 28, once dreamed of becoming a hairdresser. But rising rent and exorbitant child care costs for her two children have put training out of reach. Just two generations ago, she said, her grandmother raised a family in her own home as a single parent, while working part-time as a nurse.',
        image:
            'https://static01.nyt.com/images/2024/03/19/multimedia/00oz-misery-kbjt/00oz-misery-kbjt-superJumbo.jpg?quality=75&auto=webp',
        date: '27 march, 2024'),
    NewsItem(
        title: 'The Trustbuster Who Has Apple and Google in His Sights',
        text:
            'Shortly after Jonathan Kanter took over the Justice Department’s antitrust division in November 2021, the agency secured an additional \$50 million to investigate monopolies, bust criminal cartels and block mergers. To celebrate, Mr. Kanter bought a prop of a giant check, placed it outside his office and wrote on the check’s memo line: “Break ’Em Up.” Mr. Kanter, 50, has pushed that philosophy ever since, becoming a lead architect of the most significant effort in decades to fight the concentration of power in corporate America. On Thursday, he took his biggest swing when the Justice Department filed an antitrust lawsuit against Apple. In the 88-page lawsuit, the government argued that Apple had violated antitrust laws with practices intended to keep customers reliant on its iPhones and less likely to switch to competing devices. That lawsuit joins two Justice Department antitrust cases against Google that argue the company illegally shored up monopolies. Mr. Kanter’s staff has also challenged numerous corporate mergers, including suing to stop JetBlue Airways from buying Spirit Airlines. “We want to help real people by making sure that our antitrust laws work for workers, work for consumers, work for entrepreneurs and work to protect our democratic values,” Mr. Kanter said in a January interview. He declined to comment on the Google cases and other active litigation. At a news conference about the Apple lawsuit on Thursday, Mr. Kanter compared the action to past Justice Department challenges to Standard Oil, AT&T and Microsoft. The suit is aimed at protecting “the market for the innovations that we can’t yet perceive,” he said.',
        image:
            'https://static01.nyt.com/images/2024/03/04/multimedia/00KANTER-01-wjph/00KANTER-01-wjph-superJumbo.jpg?quality=75&auto=webp',
        date: '22 march, 2024'),
    NewsItem(
        title:
            'Falling fertility rates pose major challenges for the global economy, report finds',
        text:
            'Falling fertility rates are set to spark a transformational demographic shift over the next 25 years, with major implications for the global economy, according to a new study. By 2050, three-quarters of countries are forecast to fall below the population replacement birth rate of 2.1 babies per female, research published Wednesday in The Lancet medical journal found. That would leave 49 countries — primarily in low-income regions of sub-Saharan Africa and Asia — responsible for the majority of new births. “Future trends in fertility rates and livebirths will propagate shifts in global population dynamics, driving changes to international relations and a geopolitical environment, and highlighting new challenges in migration and global aid networks,” the report’s authors wrote in their conclusion. By 2100, just six countries are expected to have population-replacing birth rates: The African nations of Chad, Niger and Tonga, the Pacific islands of Samoa and Tonga, and central Asia’s Tajikistan. That shifting demographic landscape will have “profound” social, economic, environmental and geopolitical impacts, the report’s authors said. In particular, shrinking workforces in advanced economies will require significant political and fiscal intervention, even as advances in technology provide some support. “As the workforce declines, the total size of the economy will tend to decline even if output per worker stays the same. In the absence of liberal migration policies, these nations will face many challenges,” Dr. Christopher Murray, a lead author of the report and director at the Institute for Health Metrics and Evaluation, told CNBC.',
        image:
            'https://image.cnbcfm.com/api/v1/image/107390984-1711040373729-GettyImages-200536196-001.jpg?v=1711040551&w=740&h=416&ffmt=webp&vtcrop=y',
        date: '22 march, 2024'),
    NewsItem(
        title: '‘Strike Madness’ Hits Germany While Its Economy Stumbles',
        text:
            'For those striking at the gates of the SRW scrap metal plant, just outside Germany’s eastern city of Leipzig, time can be counted not just in days — 136 so far — but in the thousands of card games played, the liters of coffee imbibed and the armfuls of firewood burned. Or it can be measured by the length of Jonny Bohne’s beard. He vows not to shave until he returns to the job he has held for two decades. Wearing his red union baseball cap and tending the blaze inside an oil drum, Mr. Bohne, 56, looks like a scruffy Santa Claus. The dozens of workers at the SRW recycling center say their strike has become the longest in postwar German history — a dubious honor in a nation with a history of harmonious labor relations. (The previous record, 114 days, was held by shipyard workers in the northern city of Kiel who struck in the 1950s.) While monthslong strikes may be commonplace in some other European countries like Spain, Belgium or France, where workers’ protests are something of a national pastime, Germany has long prided itself on nondisruptive collective bargaining. A wave of strikes this year has Germans asking whether that is now changing. By some measures, the first three months of 2024 have had the most strikes in the country in 25 years.Striking workers have brought railways and airports to a standstill. Doctors have walked out of hospitals. Bank employees left work for days. “Germany — strike nation?” a recent headline in the German magazine Der Spiegel asked. Jens Spahn, deputy leader of the conservative Christian Democrats in the Parliament, denounced a “strike madness” that he said risked paralyzing the country.',
        image:
            'https://static01.nyt.com/images/2024/03/22/world/22germany-strikes/22germany-strikes-superJumbo.jpg?quality=75&auto=webp',
        date: '22 march, 2024'),
    NewsItem(
        title: 'What Comes Next for the Housing Market?',
        text:
            'Federal Reserve officials are planning to cut interest rates this year, real estate agents are likely to slash their commissions after a major settlement and President Biden has begun to look for ways his administration can alleviate high housing costs. A lot of change is happening in the housing market, in short. While sales have slowed markedly amid higher interest rates, both home prices and rents remain sharply higher than before the pandemic. The question now is whether the recent developments will cool costs down Economists who study the housing market said they expected cost increases to be relatively moderate over the next year. But they don’t expect prices to actually come down in most markets, especially for home purchases. Demographic trends are still fueling solid demand, and cheaper mortgages could lure buyers into a market that still has too few homes for sale, even if lower rates could help draw in more supply around the edges. “It has become almost impossible for me to imagine home prices actually going down,” said Glenn Kelman, the chief executive of Redfin. “The constraints on inventory are so profound.” Here’s what is changing and what it could mean for buyers, sellers and renters. Mortgages have been pricey lately in part because the Fed has lifted interest rates to a more-than-two-decade high. The central bank doesn’t set mortgage rates, but its policy moves trickle out to make borrowing more expensive across the economy. Rates on 30-year mortgages have been hovering just below 7 percent, up from below 3 percent as recently at 2021. Those rates could come down when the Fed lowers borrowing costs, particularly if investors come to expect that it will cut rates more notably than what they currently anticipate.',
        image:
            'https://static01.nyt.com/images/2024/03/21/multimedia/21dc-fedhousing-vthp/21dc-fedhousing-vthp-superJumbo.jpg?quality=75&auto=webp',
        date: '21 march, 2024'),
    NewsItem(
        title:
            'Why the Panama Canal Didn’t Lose Money When Ship Crossings Fell',
        text:
            'Low water levels have forced officials to slash the number of ships that are allowed through the Panama Canal, disrupting global supply chains and pushing up transportation costs. But, remarkably, the big drop in ship traffic has not — at least so far — led to a financial crunch for the canal, which passes on much of its toll revenue to Panama’s government. That’s because the canal authority introduced hefty increases in tolls before the water crisis started. In addition, shipping companies have been willing to pay large sums in special auctions to secure one of the reduced number of crossings. In the 12 months through September, the canal’s revenue rose 15 percent, to nearly \$5 billion, even though the tonnage shipped through the canal fell 1.5 percent. The Panama Canal Authority declined to say how much money it earned from auctions. At a maritime conference last week in Stamford, Conn., Ilya Espino de Marotta, the canal’s deputy administrator, said the auction fees, which reached as much as \$4 million per passage last year, “helped a little bit.” But even now, during a quieter season for global shipping, auction fees can double the cost of using the canal. This month, Avance Gas, which ships liquefied petroleum gas, paid a \$401,000 auction fee and \$400,000 for the regular toll, said Oystein Kalleklev, the company’s chief executive. Auction fees are ultimately borne by the company whose goods are being shipped. The canal’s financial stability in the face of a dire water shortage shows how the people who manage crucial links in global supply chains are adapting as climate change disrupts operations. It also helps that there are no viable alternatives in Latin America to the canal, an engineering marvel that opened in 1914 and handles an estimated 5 percent of seaborne trade.',
        image:
            'https://static01.nyt.com/images/2024/03/22/multimedia/00panama-canal-kgbp/00panama-canal-kgbp-superJumbo.jpg?quality=75&auto=webp',
        date: '21 march, 2024'),
    NewsItem(
        title: 'The Global Effort to Make an American Microchip',
        text:
            'Semiconductors are vital to the modern economy, powering everything from video games and cars to supercomputers and weapons systems. The Biden administration is investing \$39 billion to help companies build more factories in the United States to bring more of this supply chain back home. But even after U.S. facilities are built, chip manufacturing will remain decidedly global. The international journey of one kind of chip, made by the American semiconductor manufacturer Onsemi and used to power electric vehicles, demonstrates how difficult it will be to decouple from East Asia and other regions that dominate the chip market. The first steps for making this particular semiconductor, known as a silicon carbide chip, happen in a factory in New Hampshire. The chip ends up in cars driven on American roads and elsewhere. But in between, the process will depend on raw materials, machinery and intellectual property from dozens of foreign suppliers and factories. The first step begins inside Onsemi\'s New Hampshire plant, with a jet black powder of silicon and carbon from Norway, Germany and Taiwan. The powder is added to graphite and gases that come from the United States, Germany and Japan, then heated to a temperature close to that of the sun, producing a crystal that will form the backbone of millions of chips. This crystal, which is almost as hard as a diamond, is sent to a factory in the Czech Republic to be sliced into thin wafers using special machinery from the United States, Germany, Italy and Japan. The wafers are shipped to an ultraclean factory in South Korea, where mechanized pails carry them between complex machines from the Netherlands, the United States and Japan. The machines use chemicals, gases and intricate patterns of light to create channels just a few atoms wide for electrons to move through as they convey information. The wafer is then cut into tiny chiplets, which travel to facilities in China, Malaysia and Vietnam for finishing touches and testing. Then the chips head to global distribution centers in China and Singapore.Finally, the chips are sent to Hyundai, BMW and other automakers in Asia and Europe, which put them into power systems for electric vehicles. Other chips are sold to auto parts suppliers in Canada, China and the United States.',
        image:
            'https://static01.nyt.com/images/2024/02/23/multimedia/00chips-01-pqzj/00chips-01-pqzj-superJumbo.jpg',
        date: '19 march, 2024'),
    NewsItem(
        title:
            'Japan’s Labor Market Has a Lesson for the Fed: Women Can Surprise You',
        text:
            'Japan’s economy has rocketed into the headlines this year as inflation returns for the first time in decades, workers win wage gains and the Bank of Japan raises interest rates for the first time in 17 years. But there’s another, longer-running trend happening in the Japanese economy that could prove interesting for American policymakers: Female employment has been steadily rising. Working-age Japanese women have been joining the labor market for years, a trend that has continued strongly in recent months as a tight labor market prods companies to work to attract new employees. The jump in female participation has happened partly by design. Since about 2013, the Japanese government has tried to make both public policies and corporate culture more friendly to women in the work force. The goal was to attract a new source of talent at a time when the world’s fourth-largest economy faces an aging and shrinking labor market. “Where Japan did well over the recent decade is putting the care infrastructure in place for working parents,” Nobuko Kobayashi, a partner at EY-Parthenon in Japan, wrote in an email. Still, even some who were around when the “womenomics” policies were designed have been caught off guard by just how many Japanese women are now choosing to work thanks to the policy changes and to shifting social norms. “We all underestimated it,” said Adam Posen, the president of the Peterson Institute for International Economics, who advised the Japanese government while it was instituting the policies meant to bring on more female workers. Mr. Posen thought at the time that they might be able to get perhaps 800,000 women into the labor market, far fewer than the roughly three million who have actually joined (albeit many of them are part time).',
        image:
            'https://static01.nyt.com/images/2024/03/21/multimedia/19dc-japan-us-ckgp/19dc-japan-us-ckgp-superJumbo.jpg?quality=75&auto=webp',
        date: '19 march, 2024'),
    NewsItem(
        title: 'Fed Meets Amid Worries That Inflation Progress Might Stall',
        text:
            'Slowing America’s rapid inflation has been an unexpectedly painless process so far. High interest rates are making it expensive to take out a mortgage or borrow to start a business, but they have not slammed the brakes on economic growth or drastically pushed up unemployment. Still, price increases have been hovering around 3.2 percent for five months now. That flatline is stoking questions about whether the final phase in fighting inflation could prove more difficult for the Federal Reserve. Fed officials will have a chance to respond to the latest data on Wednesday, when they conclude a two-day policy meeting. Central bankers are expected to leave interest rates unchanged, but their fresh quarterly economic projections could show how the latest economic developments are influencing their view of how many rate cuts are coming this year and next. The Fed’s most recent economic estimates, released in December, suggested that Fed officials would make three quarter-point rate cuts by the end of 2024. Since then, the economy has remained surprisingly strong and inflation, while still down sharply from its 2022 highs, has proved stubborn. Some economists think it’s possible that officials could dial back their rate cut expectations, projecting just two moves this year. By leaving rates higher for slightly longer, officials could keep pressure on the economy, guarding against the risk that inflation might pick back up. “The Federal Reserve should not be in a race to cut rates,” said Joseph Davis, Vanguard’s global chief economist, explaining that the economy has held up better than would be expected if rates were weighing on growth drastically, and that cutting prematurely risks allowing inflation to run warmer in 2025. “We have a growing probability that they don’t cut rates at all this year.”',
        image:
            'https://static01.nyt.com/images/2024/03/19/multimedia/19dc-fedpreview-jlpv/19dc-fedpreview-jlpv-superJumbo.jpg?quality=75&auto=webp',
        date: '19 march, 2024'),
    NewsItem(
        title:
            'Email ‘Mistake’ on Inflation Data Prompts Questions on What Is Shared',
        text:
            'One afternoon in late February, an employee at the Bureau of Labor Statistics sent an email about an obscure detail in the way the government calculates inflation — and set off an unlikely firestorm. Economists on Wall Street had spent two weeks puzzling over an unexpected jump in housing costs in the Consumer Price Index. Several had contacted the Bureau of Labor Statistics, which produces the numbers, to inquire. Now, an economist inside the bureau thought he had solved the mystery. In an email addressed to “Super Users,” the economist explained a technical change in the calculation of the housing figures. Then, departing from the bureaucratic language typically used by statistical agencies, he added, “All of you searching for the source of the divergence have found it.” To the inflation obsessives who received the email — and other forecasters who quickly heard about it — the implication was clear: The pop in housing prices in January might have been not a fluke but rather a result of a shift in methodology that could keep inflation elevated longer than economists and Federal Reserve officials had expected. That could, in turn, make the Fed more cautious about cutting interest rates. “I nearly fell off my chair when I saw that,” said Ian Shepherdson, chief economist at Pantheon Macroeconomics, a forecasting firm.',
        image:
            'https://static01.nyt.com/images/2024/03/18/multimedia/00data-leak-kpfb/00data-leak-kpfb-superJumbo.jpg?quality=75&auto=webp',
        date: '19 march, 2024'),
    NewsItem(
        title: 'Can Europe Save Forests Without Killing Jobs in Malaysia?',
        text:
            'The European Union’s upcoming ban on imports linked to deforestation has been hailed as a “gold standard” in climate policy: a meaningful step to protect the world’s forests, which help remove planet-killing greenhouse gases from the atmosphere. The law requires traders to trace the origins of a head-spinning variety of products — beef and books, chocolate and charcoal, lipstick and leather. To the European Union, the mandate, set to take effect next year, is a testament to the bloc’s role as a global leader on climate change. The policy, though, has gotten caught in fierce crosscurrents about how to navigate the economic and political trade-offs demanded by climate change in a world where power is shifting and international institutions are fracturing. Developing countries have expressed outrage — with Malaysia and Indonesia among the most vocal. Together, the two nations supply 85 percent of the world’s palm oil, one of seven critical commodities covered by the European Union’s ban. And they maintain that the law puts their economies at risk. In their eyes, rich, technologically advanced countries — and former colonial powers — are yet again dictating terms and changing the rules of trade when it suits them. “Regulatory imperialism,” Indonesia’s economic minister declared. The view fits with complaints from developing countries that the reigning international order neglects their concerns. The palm oil dispute also encapsulates a central tension in the economics of climate change: the argument that lower- and middle-income nations are being compelled to bear the cost of ruinous environmental shifts caused mostly by the world’s wealthiest nations.',
        image:
            'https://static01.nyt.com/images/2024/03/18/multimedia/00malaysia-palmoil-03-bzft/00malaysia-palmoil-03-bzft-superJumbo.jpg?quality=75&auto=webp',
        date: '14 march, 2024'),
    NewsItem(
        title:
            'U.S. Judge Blocks Rule Extending Reach of Labor Law to Franchisers',
        text:
            'A federal judge, siding with business lobbying groups, has blocked a rule that would broaden the reach of federal labor law to make big franchisers like McDonald’s responsible for the conditions of workers they have not directly hired. The judge, J. Campbell Barker of the United States District Court for the Eastern District of Texas, on Friday vacated a rule issued by the National Labor Relations Board determining when a company is a joint employer, making it liable under labor law for the working conditions of those hired by a franchisee or provided by a staffing agency. He said the rule, which was to go into effect Monday, was too broad. The decision by Judge Barker, a nominee of former President Donald J. Trump, keeps in place a more business-friendly standard for assigning legal liability. Unions and employees support the rule because it makes it easier to bargain for better conditions, while franchisers say it would disrupt their business model. The U.S. Chamber of Commerce, which led a group of business groups challenging the rule, applauded the ruling. “It will prevent businesses from facing new liabilities related to workplaces they don’t control, and workers they don’t actually employ,” Suzanne P. Clark, chief executive of the chamber, said in a statement. The labor board’s chair, Lauren McFerran, who was named by President Biden, said in a statement that the ruling was “a disappointing setback,” but “not the last word” on the joint-employer standard. If the board appeals the ruling, the case would move to the conservative U.S. Court of Appeals for the Fifth Circuit. The labor agency pushed for the case to be moved to Washington, but Judge Barker denied that request.',
        image:
            'https://static01.nyt.com/images/2024/03/11/business/11joint-employers/11joint-owners-superJumbo.jpg?quality=75&auto=webp',
        date: '11 march, 2024'),
    NewsItem(
        title:
            'The Surprising Left-Right Alliance That Wants More Apartments in Suburbs',
        text:
            'For years, the Yimbytown conference was an ideologically safe space where liberal young professionals could talk to other liberal young professionals about the particular problems of cities with a lot of liberal young professionals: not enough bike lanes and transit, too many restrictive zoning laws. The event began in 2016 in Boulder, Colo., and has ever since revolved around a coalition of left and center Democrats who want to make America’s neighborhoods less exclusive and its housing more dense. (YIMBY, a pro-housing movement that is increasingly an identity, stands for “Yes in my backyard.”) But the vibes and crowd were surprisingly different at this year’s meeting, which was held at the University of Texas at Austin in February. In addition to vegan lunches and name tags with preferred pronouns, the conference included — even celebrated — a group that had until recently been unwelcome: red-state Republicans. The first day featured a speech on changing zoning laws by Greg Gianforte, the Republican governor of Montana, who last year signed a housing package that YIMBYs now refer to as “the Montana Miracle.” Day 2 kicked off with a panel on solutions to Texas’s rising housing costs. One of the speakers was a Republican legislator in Texas who, in addition to being an advocate for loosening land-use regulations, has pushed for a near-total ban on abortions. Anyone who missed these discussions might have instead gone to the panel on bipartisanship where Republican housing reformers from Arizona and Montana talked with a Democratic state senator from Vermont. Or noticed the list of sponsors that, in addition to foundations like Open Philanthropy and Arnold Ventures, included conservative and libertarian organizations like the Mercatus Center, the American Enterprise Institute and the Pacific Legal Foundation.',
        image:
            'https://static01.nyt.com/images/2024/03/10/multimedia/09YIMBYTOWN-cfvt/09YIMBYTOWN-cfvt-superJumbo.jpg?quality=75&auto=webp',
        date: '9 march, 2024'),
    NewsItem(
        title:
            'Biden Portrays Next Phase of Economic Agenda as Middle-Class Lifeline',
        text:
            'President Biden used his State of the Union speech on Thursday to remind Americans of his efforts to steer the nation’s economy out of a pandemic recession, and to lay the groundwork for a second term focused on making the economy more equitable by raising taxes on companies and the wealthy while taking steps to reduce costs for the middle class. Mr. Biden offered a blitz of policies squarely targeting the middle class, including efforts to make housing more affordable for first-time home buyers. The president used his speech to try and differentiate his economic proposals with those supported by Republicans, including former President Donald J. Trump. Those proposals have largely centered on cutting taxes, rolling back the Biden administration’s investments in clean energy and gutting the Internal Revenue Service. Many of Mr. Biden’s policy proposals would require acts of Congress and hinge on Democrats winning control of the House and the Senate. However, the president also unveiled plans to direct federal agencies to use their powers to reduce costs for big-ticket items like housing at a time when the lingering effects of inflation continue to weigh on economic sentiment. From taxes and housing to inflation and consumer protection, Mr. Biden had his eye on pocketbook issues. Many of the tax cuts that Mr. Trump signed into law in 2017 are set to expire next year, making tax policy among the most critical issues on the ballot this year. On Thursday night, Mr. Biden built upon many of the tax proposals that he has been promoting for the last three years, calling for big corporations and the wealthiest Americans to pay more. He proposed raising a new corporate minimum tax to 21 percent from 15 percent and proposed a new 25 percent minimum tax rate for billionaires, which he said would raise \$500 billion over a decade. Criticizing the cost of the 2017 tax cuts, Mr. Biden asked, “Do you really think the wealthy and big corporations need another \$2 trillion in tax breaks?”',
        image:
            'https://static01.nyt.com/images/2024/03/08/multimedia/08dc-sotu-econ-wmvl/08dc-sotu-econ-wmvl-superJumbo.jpg?quality=75&auto=webp',
        date: '8 march, 2024'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE4E4E4),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 65, 16, 26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.chevron_left,
                        color: Color(0xFFFE764B),
                      ),
                      Text(
                        'Back',
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            color: Color(0xFFFE764B),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'News',
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'News',
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            color: Color(0xFFE4E4E4),
                            fontSize: 16,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [getNews()],
              ),
            )),
          ),
        ],
      ),
    );
  }

  Widget getNews() {
    List<Widget> list = [];
    for (var news in newsList) {
      list.add(InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
                builder: (BuildContext context) => DescriptionNewsPage(
                      news: news,
                    )),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                            news.image!,
                          ))),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              news.title!,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontFamily: 'SF Pro Text',
                                  height: 1,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        news.date!,
                        style: const TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Text(
                    news.text!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            )
          ]),
        ),
      ));
      list.add(const SizedBox(
        height: 8,
      ));
    }
    return Column(
      children: list,
    );
  }
}
