class GraphQLQueries {
  const GraphQLQueries._();

  // ──── Problem Queries ────

  static const String problemsetQuestionList = r'''
    query problemsetQuestionList($categorySlug: String, $limit: Int, $skip: Int, $filters: QuestionListFilterInput) {
      problemsetQuestionList: questionList(
        categorySlug: $categorySlug
        limit: $limit
        skip: $skip
        filters: $filters
      ) {
        total: totalNum
        questions: data {
          acRate
          difficulty
          freqBar
          frontendQuestionId: questionFrontendId
          isFavor
          paidOnly: isPaidOnly
          status
          title
          titleSlug
          topicTags {
            name
            id
            slug
          }
          hasSolution
          hasVideoSolution
        }
      }
    }
  ''';

  static const String questionContent = r'''
    query questionContent($titleSlug: String!) {
      question(titleSlug: $titleSlug) {
        content
        mysqlSchemas
        dataSchemas
      }
    }
  ''';

  static const String questionDetail = r'''
    query questionDetail($titleSlug: String!) {
      question(titleSlug: $titleSlug) {
        questionId
        questionFrontendId
        title
        titleSlug
        content
        difficulty
        likes
        dislikes
        categoryTitle
        isPaidOnly
        acRate
        stats
        hints
        similarQuestions
        exampleTestcaseList
        metaData
        envInfo
        topicTags {
          name
          slug
        }
        codeSnippets {
          lang
          langSlug
          code
        }
        sampleTestCase
        status
      }
    }
  ''';

  static const String questionEditorData = r'''
    query questionEditorData($titleSlug: String!) {
      question(titleSlug: $titleSlug) {
        questionId
        questionFrontendId
        codeSnippets {
          lang
          langSlug
          code
        }
        envInfo
        enableRunCode
        hasFrontendPreview
        frontendPreviews
      }
    }
  ''';

  static const String consolePanelConfig = r'''
    query consolePanelConfig($titleSlug: String!) {
      question(titleSlug: $titleSlug) {
        questionId
        questionFrontendId
        questionTitle
        enableDebugger
        enableRunCode
        enableSubmit
        enableTestMode
        exampleTestcaseList
        metaData
      }
    }
  ''';

  // ──── Auth / Session Queries ────

  static const String globalData = r'''
    query globalData {
      userStatus {
        userId
        username
        isPremium
        activeSessionId
        isSignedIn
      }
    }
  ''';

  static const String userProfile = r'''
    query userPublicProfile($username: String!) {
      matchedUser(username: $username) {
        username
        profile {
          realName
          ranking
          reputation
          starRating
        }
        submitStats: submitStatsGlobal {
          acSubmissionNum {
            difficulty
            count
            submissions
          }
        }
      }
    }
  ''';

  // ──── User Stats Queries ────

  static const String userStats = r'''
    query userSessionProgress($username: String!) {
      allQuestionsCount {
        difficulty
        count
      }
      matchedUser(username: $username) {
        submitStats {
          acSubmissionNum {
            difficulty
            count
            submissions
          }
          totalSubmissionNum {
            difficulty
            count
            submissions
          }
        }
        userCalendar {
          activeYears
          streak
          totalActiveDays
          submissionCalendar
        }
        profile {
          ranking
          reputation
        }
      }
    }
  ''';

  static const String userQuestionProgress = r'''
    query userProfileUserQuestionProgressV2($username: String!) {
      userProfileUserQuestionProgressV2(userSlug: $username) {
        numAcceptedQuestions {
          count
          difficulty
        }
        numFailedQuestions {
          count
          difficulty
        }
        numUntouchedQuestions {
          count
          difficulty
        }
        userSessionBeatsPercentage {
          difficulty
          percentage
        }
      }
    }
  ''';

  static const String userCalendar = r'''
    query UserProfileCalendar($username: String!, $year: Int!) {
      matchedUser(username: $username) {
        userCalendar(year: $year) {
          activeYears
          streak
          totalActiveDays
          dccBadges {
            timestamp
            badge {
              name
              icon
            }
          }
          submissionCalendar
        }
      }
    }
  ''';

  static const String contestRankingInfo = r'''
    query userContestRankingInfo($username: String!) {
      userContestRanking(username: $username) {
        attendedContestsCount
        rating
        globalRanking
        totalParticipants
        topPercentage
        badge {
          name
        }
      }
      userContestRankingHistory(username: $username) {
        attended
        trendDirection
        problemsSolved
        totalProblems
        finishTimeInSeconds
        rating
        ranking
        contest {
          title
          startTime
        }
      }
    }
  ''';

  static const String skillStats = r'''
    query skillStats($username: String!) {
      matchedUser(username: $username) {
        tagProblemCounts {
          advanced {
            tagName
            tagSlug
            problemsSolved
          }
          intermediate {
            tagName
            tagSlug
            problemsSolved
          }
          fundamental {
            tagName
            tagSlug
            problemsSolved
          }
        }
      }
    }
  ''';

  static const String languageStats = r'''
    query languageStats($username: String!) {
      matchedUser(username: $username) {
        languageProblemCount {
          languageName
          problemsSolved
        }
      }
    }
  ''';

  // ──── Daily Challenge ────

  static const String dailyChallenge = r'''
    query questionOfToday {
      activeDailyCodingChallengeQuestion {
        date
        userStatus
        link
        question {
          questionId
          questionFrontendId
          title
          titleSlug
          difficulty
          acRate
          isPaidOnly
          status
          hasSolution
          hasVideoSolution
          topicTags {
            name
            slug
          }
        }
      }
    }
  ''';

  // ──── Submission Queries ────

  static const String recentSubmissions = r'''
    query recentSubmissions($username: String!, $limit: Int!) {
      recentSubmissionList(username: $username, limit: $limit) {
        title
        titleSlug
        timestamp
        statusDisplay
        lang
      }
    }
  ''';

  static const String recentAcSubmissions = r'''
    query recentAcSubmissions($username: String!, $limit: Int!) {
      recentAcSubmissionList(username: $username, limit: $limit) {
        title
        titleSlug
        timestamp
        statusDisplay
        lang
      }
    }
  ''';

  static const String submissionDetail = r'''
    query submissionDetails($submissionId: Int!) {
      submissionDetails(submissionId: $submissionId) {
        runtime
        runtimeDisplay
        runtimePercentile
        runtimeDistribution
        memory
        memoryDisplay
        memoryPercentile
        memoryDistribution
        code
        timestamp
        statusCode
        lang {
          name
          verboseName
        }
        question {
          questionId
          title
          titleSlug
        }
        totalCorrect
        totalTestcases
      }
    }
  ''';

  // ──── Contest Queries ────

  static const String allContests = r'''
    query allContests {
      allContests {
        title
        titleSlug
        startTime
        duration
        originStartTime
        isVirtual
        containsPremium
      }
    }
  ''';

  // ──── Official Solution ────

  static const String officialSolution = r'''
    query OfficialSolution($titleSlug: String!) {
      question(titleSlug: $titleSlug) {
        solution {
          id
          title
          content
          contentTypeId
          paidOnly
          hasVideoSolution
          paidOnlyVideo
          canSeeDetail
          rating {
            count
            average
          }
          topic {
            id
            commentCount
            topLevelCommentCount
            viewCount
          }
        }
      }
    }
  ''';
}
